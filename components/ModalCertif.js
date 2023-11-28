import { useState } from "react";
import useInput from "../hooks/useInput";
import Modal from "./Modal";
import Image from "next/image";

export default function ModalCertificate({
    setOpenModal,
    addPortfolio,
    editPortfolio,
    portfolio,
}) {
    const [title, handleTitleChange] = useInput(`${portfolio?.title ?? ""}`);
    const [description, handleDescriptionChange] = useInput(
        `${portfolio?.short_description ?? ""}`
    );
    const [idCertif, handleIdCertifChange] = useInput(
        `${portfolio?.id_certif ?? ""}`
    );
    const [link, handleLinkChange] = useInput(`${portfolio?.link ?? ""}`);
    const [techName, handleTechName] = useInput(
        `${portfolio?.tech_name ?? ""}`
    );
    const [image, setImage] = useState(`${portfolio?.image_path ?? ""}`);
    const [pdf, setPdf] = useState(`${portfolio?.pdf_path ?? ""}`);

    function submitThread() {
        if (Object.keys(portfolio).length == 0) {
            addPortfolio({
                title,
                idCertif,
                link,
                description,
                techName,
                image,
                pdf,
            });
        } else {
            editPortfolio({
                id: portfolio.id,
                title,
                idCertif,
                link,
                description,
                techName,
                image,
                pdf,
            });
        }
    }

    return (
        <>
            <Modal setOpenModal={setOpenModal} submitThread={submitThread}>
                <h1>Tambah Certificate</h1>
                <div className="row">
                    <div className="title">
                        <p>Title / Project Name</p>
                        <input
                            type="text"
                            placeholder="Isikan title"
                            value={title}
                            onChange={handleTitleChange}
                        />
                    </div>
                    <div className="category">
                        <p>Technology Name</p>
                        <input
                            type="text"
                            placeholder="tech_name"
                            value={techName}
                            onChange={handleTechName}
                        />
                    </div>
                </div>
                <div className="row">
                    <div className="category">
                        <p>Credential ID</p>
                        <input
                            type="text"
                            placeholder="credential id jika ada"
                            value={idCertif}
                            onChange={handleIdCertifChange}
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
                                    src={`https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/images/certificate/${
                                        image == "" ? "empty.png" : image
                                    }`}
                                    width={100}
                                    height={100}
                                    alt="image"
                                />
                            )}
                            <div>
                                <label for="upload-photo">Browse...</label>
                                <p>
                                    {image.name?.match(
                                        /([^\\]+)(?=\.\w+$)/
                                    )[0] ?? ""}
                                </p>
                            </div>
                            <input
                                id="upload-photo"
                                type="file"
                                placeholder="Isikan link image"
                                accept="image/*"
                                value={image.name}
                                onChange={(e) =>
                                    setImage({
                                        files: e.target.files[0],
                                        name: e.target.value,
                                    })
                                }
                            />
                        </span>
                    </div>
                </div>
                <div className="row">
                    <div className="category">
                        <p>Link Penyelenggara</p>
                        <input
                            type="text"
                            placeholder="Isikan link penyelenggara program"
                            value={link}
                            onChange={handleLinkChange}
                        />
                    </div>
                    <div className="pdf">
                        <p>PDF</p>
                        <span className="pdf-content">
                            <span style={{ width: "19vh", overflow: "hidden" }}>
                                <p>
                                    {pdf.name?.match(/([^\\]+)(?=\.\w+$)/)[0] ??
                                        pdf}
                                    .pdf
                                </p>
                            </span>
                            <div>
                                <label for="upload-pdf">Browse...</label>
                            </div>
                            <input
                                id="upload-pdf"
                                type="file"
                                placeholder="isikan pdf"
                                accept="application/pdf"
                                onChange={(e) =>
                                    setPdf({
                                        files: e.target.files[0],
                                        name: e.target.value,
                                    })
                                }
                            />
                        </span>
                    </div>
                </div>
                <div className="body">
                    <p>Description</p>
                    <textarea
                        cols="60"
                        rows="4"
                        placeholder="apa yang kamu pikirkan ?"
                        value={description}
                        onChange={handleDescriptionChange}
                    />
                </div>
            </Modal>
        </>
    );
}
