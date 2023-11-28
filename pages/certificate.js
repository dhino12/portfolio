import { motion } from "framer-motion" 
import { useEffect, useState } from "react";
import Header from "../components/header"
import ModalCertif from "../components/ModalCertif";
import Sosmed from "../components/Sosmed";
import certif from "../data/certif";
import {
    cardVariants,
    containerVariants, contentVariants,
} from "../variants/certifVariants";
import supabase from "../libs/supabaseClient";
import ModalPdf from "../components/ModalPdf";
 
export default function Certificate() {
    const [fields, setFields] = useState([]);
    const [dataCertifPdf, setDataCertifPdf] = useState("");
    const [isOpenModal, setOpenModal] = useState(false);

    useEffect(() => {
        window.document.body.style.backgroundColor = "white"

        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("certificate")
                .select()

            if (data) {
                setFields(data)
            }
        }
        fetchUser()
    }, []);

    return (
        <>    
            <motion.div 
                className="pattern-line"
                initial={{opacity: 0}}
                animate={{opacity: 0.2}}
                exit={{opacity: 0}}/>

            <Header />
            <motion.div
                className="container-certif"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
            >
                <div className="nav">
                    <Sosmed />
                </div>

                <div className="page-name">
                    <h2 className="vertical-right">CERTIFICATE</h2>
                </div>

                {
                    isOpenModal && (
                        <ModalPdf
                            setOpenModal={setOpenModal}
                            pdf={`https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/pdf/certificate/${dataCertifPdf ?? ""}`}
                        />
                    )
                }
                
                <motion.div 
                    className="content-certif"
                    variants={contentVariants}
                    initial='hidden'
                    animate='visible'>
                    {
                        fields.map((field) => (
                            <div className="content-certif-card" key={field.id} onClick={() => {
                                setOpenModal(true)
                                setDataCertifPdf(field.pdf_path)
                            }}>
                                <div className="content-certif-card-header">
                                    <h2>{field.title}</h2>
                                    <p>#{field.tech_name.replace(" ", "").replace(",", " #")}</p>
                                </div>
                                <div className="content-certif-card-img">
                                    <img src= {`https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/images/certificate/${field.image_path}`} />
                                </div>
                            </div>
                        ))
                    }
                </motion.div>
            </motion.div>
        </>
    )
}