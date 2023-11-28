import { useState } from "react";
import useInput from "../pages/hooks/useInput";
import Modal from "./Modal";
import Image from "next/image";

export default function ModalPortfolio({
    setOpenModal, addPortfolio, editPortfolio, portfolio
}) {
    const [title, handleTitleChange] = useInput(`${portfolio?.title ?? ""}`);
    const [description, handleDescriptionChange] = useInput(`${portfolio?.short_description ?? ""}`);
    const [techName, handleTechNameChange] = useInput(`${portfolio?.tech_name ?? ""}`);
    const [link, handleLinkChange] = useInput(`${portfolio?.link ?? ""}`);
    const [image, setImage] = useState(`${portfolio?.image_path ?? ""}`);

    function submitThread() {
        if (Object.keys(portfolio).length == 0) {
            addPortfolio({title, tech_name: techName, link, description, image});
        } else {
            editPortfolio({id: portfolio.id, title, tech_name: techName, link, description, image})
        }
    }
    
    return (
        <>
            <Modal
                setOpenModal={setOpenModal}
                submitThread={submitThread}
            >
                <h1>Tambah Portfolio</h1>
                <p>Silahkan isi portfolio kamu ?</p>
                <div className="row">
                    <div className="title">
                        <p>Title / Project Name</p>
                        <textarea
                            cols="50"
                            rows="2"
                            placeholder="Isikan title"
                            value={title}
                            onChange={handleTitleChange}
                        />
                    </div>
                    <div className="category">
                        <p>Tech Name</p>
                        <textarea
                            cols="50"
                            rows="2"
                            placeholder="lebih dari 1 ? pisahkan dengan koma (,)"
                            value={techName}
                            onChange={handleTechNameChange}
                        />
                    </div>
                </div>
                <div className="row">
                    <div className="category">
                        <p>Link Penyelenggara</p>
                        <textarea
                            cols="50"
                            rows="2"
                            placeholder="Isikan link penyelenggara program"
                            value={link}
                            onChange={handleLinkChange}
                        />
                    </div>
                    <div className="image">
                        <p>Image</p>
                        <span className="image-content">
                            {image.files && (
                                <img
                                    src={URL.createObjectURL(image.files)} 
                                    width={100}
                                    height={100}
                                    alt="image"
                                />
                            )}
                            {!image.files && (
                                <Image 
                                    src={`https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/images/${image == "" ? 'empty.png' : image}`} 
                                    width={100}
                                    height={100}
                                    alt="image"
                                />
                            )}
                            <div>
                                <label for="upload-photo">Browse...</label>
                                <p>{image.name?.match(/([^\\]+)(?=\.\w+$)/)[0] ?? ""}</p>
                            </div>
                            <input
                                id="upload-photo"
                                type="file"
                                placeholder="Isikan link image"
                                accept="image/*"
                                value={image.name}
                                onChange={(e) => setImage({files: e.target.files[0], name: e.target.value})}
                            />
                        </span>
                    </div>
                </div>
                <div className="body">
                    <p>Description</p>
                    <p>
                        <strong>{description.length}</strong>/320
                    </p>
                    <textarea
                        cols="60"
                        rows="8"
                        placeholder="apa yang kamu pikirkan ?"
                        value={description}
                        onChange={handleDescriptionChange}
                    />
                </div>
            </Modal>
        </>
    )
    
}