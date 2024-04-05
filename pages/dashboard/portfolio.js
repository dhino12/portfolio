import Link from "next/link";
import Image from "next/image"
import Dashboard from "../../layouts/Dashboard"
import bgProfile from "../../public/asset/webp/bg-repo.png"
import CardPortfolio from "../../components/CardPortfolio";
import { useEffect, useState } from "react";
import ModalPortfolio from "../../components/ModalPortfolio";
import supabase from "../../libs/supabaseClient";
import generateUniqueId from "../../utils/uniqid";
import { useRouter } from "next/router";

export default function portfolio() {
    const router = useRouter()
    const [isOpenModal, setOpenModal] = useState(false);
    const [fields, setFields] = useState([]);
    const [editActivity, setEditActivity] = useState({}) // for edit modal

    useEffect(() => {
        if (!sessionStorage.getItem("auth")) return router.push("/dashboard");
        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("portfolio")
                .select()
                .order("created_at", {ascending: false})

            if (data) {
                setFields(data)
            }
        }
        fetchUser()
    }, [])

    async function inputData({title, tech_name, link, description, image}) {
        const imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
        const uniqueId = generateUniqueId();

        const {
            data: imageData, 
            error: imageError
        } = await supabase
            .storage
            .from("images")
            .upload(`portfolio/image-${imageName}-${uniqueId}`, image.files)

        if (error) {
            console.error(error);
            return alert("Error-Image: " + error)
        }

        const { data, error } = await supabase
            .from("portfolio")
            .insert({
                title,
                tech_name,
                short_description: description,
                link,
                image_path: imageData.path,
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

    async function updataData({id, title, tech_name, link, description, image}) {
        const uniqueId = generateUniqueId();
        const dataImage = fields.filter(filedPortfolio => filedPortfolio.id == id)[0]
        let imageDataLet = [{}]
        
        if (dataImage.image_path != image) {
            const imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
            const {
                data: imageData, 
                error: imageError
            } = await supabase
                .storage
                .from("images") 
                .remove(dataImage.image_path)
            
            if (imageError) {
                console.error(imageError);
                return alert("Error-Image: " + imageError)
            }
            const {
                data: imageDataUpload, 
                error: imageErrorUpload
            } = await supabase
                .storage
                .from("images")
                .upload(`portfolio/image-${imageName}-${uniqueId}`, image.files)
            imageDataLet = imageDataUpload
        } 
        
        const { data, error } = await supabase
            .from("portfolio")
            .update({
                title,
                tech_name,
                short_description: description,
                link,
                image_path: imageDataLet?.path ?? image,
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
            .from("portfolio")
            .delete()
            .eq("id", id)
            .select()

        const {
            data: imageData, 
            error: imageError
        } = await supabase
            .storage
            .from("images") 
            .remove(dataImage.image_path)
        if (error) {
            console.error(error);
            alert("Oops something wrong")
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
        <>
            {isOpenModal && (
                <ModalPortfolio
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
                    <h1>Portfolio</h1>
                </div>
                <div className="repo__content">
                    <button className="button-add" onClick={() => {
                        setEditActivity({})
                        setOpenModal(true)
                    }}>Add Portfolio</button>
                    <div className="repo_container_main">
                        {
                            fields.map((portfolioData, index) => (
                                <CardPortfolio
                                        image={portfolioData.image_path}
                                        title={portfolioData.title}
                                        techName={portfolioData.tech_name}
                                        link={portfolioData.link}
                                        key={index}
                                    >
                                    <button onClick={() => {
                                        setOpenModal(true)
                                        setEditActivity(portfolioData)
                                    }}>Edit</button>
                                    <button onClick={() => {
                                        deleteData(portfolioData.id)
                                    }}>Delete</button>
                                </CardPortfolio>
                            ))
                        }
                    </div>
                </div>
            </div>
        </>
    )
}

portfolio.layout = Dashboard
