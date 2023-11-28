import { useState } from "react";
import useInput from "../pages/hooks/useInput";
import Modal from "./Modal";
import Image from "next/image";

export default function ModalExperience({
    setOpenModal, addPortfolio, editPortfolio, portfolio
}) {
    const [companyName, handleCompanyName] = useInput(`${portfolio?.company_name ?? ""}`);
    const [jobDesc, handleJobDescChange] = useInput(`${portfolio?.job_desc ?? ""}`);
    const [location, handleLocationChange] = useInput(`${portfolio?.location ?? ""}`);
    const [fromDate, handleFromDateChange] = useInput(`${portfolio?.from ?? ""}`);
    const [techName, handleTechNameChange] = useInput(`${portfolio?.tech_name ?? ""}`);
    const [toDate, handleToDateChange] = useInput(`${portfolio?.to ?? ""}`);
    const [images, setImages] = useState(portfolio?.image_path ?? []);

    function submitThread() {
        if (Object.keys(portfolio).length == 0) {
            addPortfolio({companyName, jobDesc, location, fromDate, toDate, images});
        } else {
            const imagesData = images.map((image) => ({
                files: image?.files,
                name: image?.name ?? image
            }))
            editPortfolio({id: portfolio.id, companyName, jobDesc, location, fromDate, toDate, images: imagesData})
        }
    }
    
    return (
        <>
            <Modal
                setOpenModal={setOpenModal}
                submitThread={submitThread}
            >
                <h1>Tambah Pengalaman</h1>
                <div className="row">
                    <div className="title">
                        <p>Company Name</p>
                        <input
                            type="text"
                            placeholder="Isikan title"
                            value={companyName}
                            onChange={handleCompanyName}
                        />
                    </div>
                    <div className="category">
                        <p>Technology Name</p>
                        <input
                            type="text"
                            placeholder="Technology Name"
                            value={techName}
                            onChange={handleTechNameChange}
                        />
                    </div>
                </div>
                <div className="row">
                    <div className="category">
                        <p>Waktu Mulai</p>
                        <input
                            type="date"
                            placeholder="Isikan waktu mulai petualangan"
                            value={fromDate}
                            onChange={handleFromDateChange}
                        />
                    </div>
                    <div className="category">
                        <p>Waktu Berakhir</p>
                        <input
                            type="date"
                            placeholder="Isikan waktu berakhir petualangan"
                            value={toDate}
                            onChange={handleToDateChange}
                        />
                    </div>
                </div>
                <div className="row"> 
                    <div className="category">
                        <p>Location</p>
                        <input
                            type="text"
                            placeholder="Location Company"
                            value={location}
                            onChange={handleLocationChange}
                        />
                    </div>
                    <div className="image">
                        <p>Image</p>
                        <span className="image-content flex-start p-bottom-10">
                            <span>
                                {
                                    images.map(image_path => (
                                        <section>{`${image_path.name?.match(/([^\\]+)(?=\.\w+$)/)[0]}.png`}</section>
                                    ))
                                }
                            </span>
                            <div className="ms-8-large">
                                <label for="upload-photo">Browse...</label>
                            </div>
                            <input
                                id="upload-photo"
                                type="file"
                                placeholder="Isikan link image"
                                accept="image/*"
                                onChange={(e) => setImages((prevState) => [...prevState, {
                                    files: e.target.files[0], name: e.target.value
                                }])}
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
                        value={jobDesc}
                        onChange={handleJobDescChange}
                    />
                </div>
            </Modal>
        </>
    )
    
}