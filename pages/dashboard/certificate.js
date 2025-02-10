import Link from "next/link";
import Image from "next/image"
import Dashboard from "../../layouts/Dashboard"
import bgProfile from "../../public/asset/webp/bg-repo.png"
import CardPortfolio from "../../components/CardPortfolio";
import { useEffect, useState } from "react";
import ModalPortfolio from "../../components/ModalPortfolio";
import supabase from "../../libs/supabaseClient";
import generateUniqueId from "../../utils/uniqid"; 
import ModalCertificate from "../../components/ModalCertif";
import { useRouter } from "next/router";

export default function Certificate() {
    const [isOpenModal, setOpenModal] = useState(false);
    const [fields, setFields] = useState([]);
    const [editActivity, setEditActivity] = useState({}) // for edit modal
    const router = useRouter()

    useEffect(() => {
        if (!sessionStorage.getItem("auth")) return router.push("/dashboard");

        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("certificate")
                .select()

            if (data) {
                setFields(data)
            }
        }
        fetchUser()
    }, [])

    async function inputData({title, idCertif, link, description, techName, image, pdf}) {
        const imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
        const pdfName = pdf.name.match(/([^\\]+)(?=\.\w+$)/)[0]
        const uniqueId = generateUniqueId();

        const {
            data: imageData, 
            error: imageError
        } = await supabase
            .storage
            .from("images/certificate")
            .upload(`image-${imageName}-${uniqueId}`, image.files)

        if (error) {
            console.error(error);
            return alert("Error-Image: " + error)
        }
        const {
            data: pdfData,
            error: pdfError
        } = await supabase
            .storage
            .from("pdf/certificate")
            .upload(`pdf-${pdfName}-${uniqueId}`, pdf.files)

        if (pdfError) {
            console.error(pdfError);
            return alert("Error-PDF: " + pdfError)
        }
        const { data, error } = await supabase
            .from("certificate")
            .insert({
                title,
                short_description: description,
                link,
                image_path: imageData.path,
                pdf_path: pdfData.path,
                credential_id: idCertif,
                tech_name: techName
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

    async function updataData({id, title, idCertif, link, description, techName, image, pdf}) {
        const uniqueId = generateUniqueId();
        const dataImage = fields.filter(filedPortfolio => filedPortfolio.id == id)[0]
        let imageDataLet = [{}]
        let pdfDataLet = [{}]
        
        if (dataImage.image_path != image) {
            const imageName = image.name.match(/([^\\]+)(?=\.\w+$)/)[0]
            const pdfName = pdf.name.match(/([^\\]+)(?=\.\w+$)/)[0]
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
                data: pdfData, 
                error: pdfError
            } = await supabase
                .storage
                .from("pdf") 
                .remove(`certificate/${dataImage.pdf_path}`)
            
            if (pdfError) {
                console.error(pdfError);
                return alert("Error-Image: " + pdfError)
            }

            const {
                data: imageDataUpload, 
                error: imageErrorUpload
            } = await supabase
                .storage
                .from("images")
                .upload(`image-${imageName}-${uniqueId}`, image.files)

            const {
                data: pdfDataUpload,
                error: pdfErrorUpload
            } = await supabase
                .storage
                .from("pdf")
                .upload(`pdf-${pdfName}-${uniqueId}`, pdf.files)
            imageDataLet = imageDataUpload
            pdfDataLet = pdfDataUpload
        } 
        
        const { data, error } = await supabase
            .from("certificate")
            .update({
                title,
                credential_id: idCertif,
                short_description: description,
                link,
                image_path: imageDataLet?.path ?? image,
                pdf_path: pdfDataLet?.path ?? pdf,
                tech_name: techName,
            })
            .eq("id", id)
            .select()
        
        if (error) {
            console.error(error);
            alert("Update Failed")
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

    async function favoriteHandler(id, isFavorite) {
        const { data, error } = await supabase
            .from("certificate")
            .update({
                is_favorite: !isFavorite
            })
            .eq("id", id)
            .select()

        if (error) {
            console.error(error);
            alert("Favorite Failed")
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
            .from("certificate")
            .delete()
            .eq("id", id)
            .select()

        const {
            data: imageData, 
            error: imageError
        } = await supabase
            .storage
            .from("images") 
            .remove(`certificate/${dataImage.image_path}`)
            
        const {
            data: pdfData, 
            error: pdfError
        } = await supabase
            .storage
            .from("pdf") 
            .remove(`certificate/${dataImage.pdf_path}`)

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
        <div>
            {isOpenModal && (
                <ModalCertificate
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
                    <h1>Certificate</h1>
                </div>
                <div className="repo__content">
                    <button className="button-add" onClick={() => {
                        setOpenModal(true)
                        setEditActivity({})
                    }}>Add Certificate</button>
                    <div className="repo_container_main">
                        {
                            fields.map((portfolioData, index) => (
                                <CardPortfolio
                                        image={`certificate/${portfolioData.image_path}`}
                                        title={portfolioData.title}
                                        techName={`Credential ID: ${portfolioData.credential_id}`}
                                        link={portfolioData.link}
                                        key={index}
                                    >
                                    <button onClick={() => {
                                        setOpenModal(true)
                                        setEditActivity(portfolioData)
                                    }}>Edit</button>
                                    <button className={`${portfolioData.is_favorite && "favorited"}`} onClick={() => {
                                        favoriteHandler(portfolioData.id, portfolioData.is_favorite)
                                    }}>Favorite</button>
                                    <button onClick={() => {
                                        deleteData(portfolioData.id)
                                    }}>Delete</button>
                                </CardPortfolio>
                            ))
                        }
                    </div>
                </div>
            </div>
        </div>
    )
}

Certificate.layout = Dashboard
