import { useEffect, useState } from "react";
import {CardSlider} from "../../components/CardSlider";
import Dashboard from "../../layouts/Dashboard";
import supabase from "../../libs/supabaseClient";
import bgProfile from "../../public/asset/webp/bg-repo.png"
import Image from "next/image";
import ModalExperience from "../../components/ModalExperience";
import generateUniqueId from "../../utils/uniqid";
import { useRouter } from "next/router";

export default function Experience() {
    const [fields, setFields] = useState([]);
    const [isOpenModal, setOpenModal] = useState(false);
    const [editActivity, setEditActivity] = useState({}) // for edit modal
    const router = useRouter()

    useEffect(() => {
        if (!sessionStorage.getItem("auth")) return router.push("/dashboard");

        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("experience")
                .select()

            if (data) {
                setFields(data)
            }
        }
        fetchUser()
    }, [])

    async function inputData({companyName, jobDesc, location, fromDate, toDate, images}) {
        const imageDatas = []
        for (const image of images) {
            const imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
            const uniqueId = generateUniqueId();

            const {
                data: imageData, 
                error: imageError
            } = await supabase
                .storage
                .from("images")
                .upload(`experience/image-${imageName}-${uniqueId}`, image.files)

            if (imageError) {
                console.error(imageError);
                return alert("Error-Image: " + imageError)
            }
            imageDatas.push(imageData.path)
        }

        const { data, error } = await supabase
            .from("experience")
            .insert({
                company_name: companyName,
                job_desc: jobDesc,
                location,
                image_path: imageDatas,
                from: fromDate,
                to: toDate,
                id_user: sessionStorage.getItem("auth")
            })
            .select()

        if (error) {
            console.error(error);
            return
        }
        if (data) {
            alert("Success")
            setOpenModal(false)
            setFields(prevState => [...prevState, data[0]])
        }
        // location.reload();
    }

    async function updataData({id, companyName, jobDesc, location, fromDate, toDate, images}) {
        const uniqueId = generateUniqueId();
        const dataImage = fields.filter(filedPortfolio => filedPortfolio.id == id)[0]
        const imageDataLet = []
        
        if (images[images.length - 1].files) {
            let imageName = ''
            for (const imagePathExperience of dataImage.image_path) {
                const {
                    data: imageData, 
                    error: imageError
                } = await supabase
                    .storage
                    .from("images") 
                    .remove(imagePathExperience)
                if (imageError) {
                    console.error(imageError);
                    return alert("Error-Image: " + imageError)
                }
            }
            for (const image of images) {
                console.log(image);
                if (image.name == undefined || image.files == undefined) continue
                console.log(image);
                imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
                const {
                    data: imageDataUpload, 
                    error: imageErrorUpload
                } = await supabase
                    .storage
                    .from("images")
                    .upload(`experience/image-${imageName}-${uniqueId}`, image.files)
                
                if (imageErrorUpload) {
                    console.error(imageErrorUpload);
                    return alert("Error-Image: " + imageErrorUpload)
                }
                imageDataLet.push(imageDataUpload.path)
            }
        } 
        // const removeImagePath = dataImage.image_path.filter((image_path) => image_path !== dataImage.image_path)
        const { data, error } = await supabase
            .from("experience")
            .update({
                company_name: companyName,
                job_desc: jobDesc,
                location,
                image_path: imageDataLet.length == 0 ? images.map(image => image.name) : imageDataLet,
                from: fromDate,
                to: toDate
            })
            .eq("id", id)
            .select()
        
        if (error) {
            console.error(error);
            return
        }
        if (data) {
            alert("Success")
            setOpenModal(false)
            setFields((prevState) => {
                return prevState.map(activityData => activityData.id == id ? data[0] : activityData)
            })
        }
    }
    
    async function deleteData(id) {
        if (!confirm('Yakin hapus data ?, hapus data ini akan termasuk menghapus aktifitas anda')) {
            return
        }
        const dataImage = fields.filter(filedPortfolio => filedPortfolio.id == id)[0]

        const { data, error } = await supabase
            .from("experience")
            .delete()
            .eq("id", id)
            .select()

        for (const imagePath of dataImage.image_path) {
            const {
                data: imageData, 
                error: imageError
            } = await supabase
                .storage
                .from("images") 
                .remove(imagePath)
            
            if (error) {
                console.error(error);
                alert("Oops something wrong")
            }
        }
        if (data) {
            alert("Success Deleted")
            setEditActivity({})
            // setActivity(null)
            setFields((prevState) => {
                return prevState.filter(activityData => activityData.id != id)
            })
        }
    }

    return (
        <div>
            {isOpenModal && (
                <ModalExperience
                    setOpenModal={setOpenModal}
                    addPortfolio={inputData}
                    editPortfolio={updataData}
                    portfolio={editActivity}
                />
            )}
            <div className="dashboard-image-bg">
                <Image
                    src={bgProfile}
                    height={450}
                />
            </div>
            <div className="container-content-input">
                <div className="info-user">
                    <h1>Experience</h1>
                </div>
                <div className="repo__content">
                    <button className="button-add" onClick={() => {
                            setOpenModal(true)
                    }}>Add Experience</button>
                    <div className="repo_container_main">
                        {
                            fields.map((experienceData, index) => (
                                <CardSlider data={experienceData} key={index}>
                                    <button onClick={() => {
                                        setOpenModal(true)
                                        setEditActivity(experienceData)
                                    }}>Edit</button>
                                    <button onClick={() => {
                                        deleteData(experienceData.id)
                                    }}>Delete</button>
                                </CardSlider>
                            ))
                        }
                    </div>
                </div>
            </div>
        </div>
    )
}

Experience.layout = Dashboard