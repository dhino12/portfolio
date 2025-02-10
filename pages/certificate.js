import { motion } from "framer-motion";
import { useEffect, useState } from "react";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import {
    cardVariants,
    containerVariants,
    contentVariants,
} from "../variants/certifVariants";
import supabase from "../libs/supabaseClient";
import ModalPdf from "../components/ModalPdf";
import { FaStar } from "react-icons/fa";

export default function Certificate() {
    const [fields, setFields] = useState([]);
    const [dataCertifPdf, setDataCertifPdf] = useState("");
    const [isOpenModal, setOpenModal] = useState(false);

    useEffect(() => {
        window.document.body.style.backgroundColor = "white";

        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("certificate")
                .select()
                .order("created_at", { ascending: false });

            if (data) {
                setFields(data);
            }
        };
        fetchUser();
    }, []);

    return (
        <>
            <motion.div
                className="pattern-line"
                initial={{ opacity: 0 }}
                animate={{ opacity: 0.2 }}
                exit={{ opacity: 0 }}
            />

            <Header />
            <motion.div
                className="container-certif"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
            >
                <div className="nav responsive">
                    <Sosmed />
                </div>

                <div className="page-name">
                    <h2 className="vertical-right">CERTIFICATE</h2>
                </div>

                {isOpenModal && (
                    <ModalPdf
                        setOpenModal={setOpenModal}
                        pdf={`https://otyewvxgwwbuqtqdnbxm.supabase.co/storage/v1/object/public/pdf/certificate/${dataCertifPdf ?? ""}`}
                    />
                )}
                <motion.div className="category-certif">
                    <h1>
                        <FaStar /> Certificate Favorite
                    </h1>
                </motion.div>
                <motion.div
                    className="content-certif"
                    variants={contentVariants}
                    initial="hidden"
                    animate="visible"
                >
                    {fields
                        .filter((field) => field.is_favorite)
                        .map((field) => (
                            <div
                                className="content-certif-card"
                                key={field.id}
                                onClick={() => {
                                    setOpenModal(true);
                                    setDataCertifPdf(field.pdf_path);
                                }}
                            >
                                <div className="content-certif-card-header">
                                    <h2>{field.title}</h2>
                                    <p>
                                        #
                                        {field.tech_name
                                            .replace(/, /g, ",")
                                            .replace(/,/g, " #")}
                                    </p>
                                </div>
                                <div className="content-certif-card-img">
                                    <img
                                        src={`https://otyewvxgwwbuqtqdnbxm.supabase.co/storage/v1/object/public/images/certificate/${field.image_path}`}
                                    />
                                </div>
                            </div>
                        ))}
                </motion.div>
                <motion.div className="category-certif">
                    <h1>All Certificate</h1>
                </motion.div>
                <motion.div
                    className="content-certif"
                    variants={contentVariants}
                    initial="hidden"
                    animate="visible"
                >
                    {fields.map((field) => (
                        <div
                            className="content-certif-card"
                            key={field.id}
                            onClick={() => {
                                setOpenModal(true);
                                setDataCertifPdf(field.pdf_path);
                            }}
                        >
                            <div className="content-certif-card-header">
                                <h2>{field.title}</h2>
                                <p>
                                    #
                                    {field.tech_name
                                        .replace(/, /g, ",")
                                        .replace(/,/g, " #")}
                                </p>
                            </div>
                            <div className="content-certif-card-img">
                                <img
                                    src={`https://otyewvxgwwbuqtqdnbxm.supabase.co/storage/v1/object/public/images/certificate/${field.image_path}`}
                                />
                            </div>
                        </div>
                    ))}
                </motion.div>
            </motion.div>
        </>
    );
}
