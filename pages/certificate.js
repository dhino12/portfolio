import { motion } from "framer-motion"
import Image from "next/image";
import { useEffect, useState } from "react";
import Header from "../components/header"
import ModalCertif from "../components/ModalCertif";
import Sosmed from "../components/Sosmed";
import certif from "../data/certif";
import {
    cardVariants,
    containerVariants, contentVariants,
} from "../variants/certifVariants";
 
export default function Certificate() {

    const [dataCertif, setDataCertif] = useState({});

    console.log(dataCertif);

    useEffect(() => {
        
    })

    return (
        <>   
            <motion.div 
                className="bg-darkYellow"
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}} />
            
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
                <ModalCertif dataCertif={dataCertif} setData={setDataCertif}/>

                <div className="nav">
                    <Sosmed />
                </div>

                <div className="page-name">
                    <h2 className="vertical-right">CERTIFICATE</h2>
                </div>

                <motion.div 
                    className="content-certif"
                    variants={contentVariants}
                    initial='hidden'
                    animate='visible'>
                    {certif.map((data, index) => (
                        <motion.div 
                            className="card" 
                            variants={cardVariants} 
                            key={index}
                            onClick={setDataCertif.bind(this, data)}
                            >
                            <div className="img-certif" style={{backgroundImage: `url('${data.foto[0]}')`}} />
                            <h2>{data.name}</h2>
                            <div className="tag">
                                {data.tag.map((tag, index) => <p key={index}>{tag}</p>)}
                            </div>
                            <p>{data.date}</p>
                        </motion.div>
                    ))}
                </motion.div>
            </motion.div>
        </>
    )
}