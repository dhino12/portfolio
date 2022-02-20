import { motion } from "framer-motion"
import { useEffect } from "react";
import Header from "./components/header"
import Sosmed from "./components/Sosmed";
import {
    containerVariants,
} from "./variants/homeVariants";

export default function Certificate() {

    useEffect(() => {
        
    })

    return (
        <>   
            <motion.div 
                className="bg-darkYellow"
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}} />
            <Header />
            <motion.div
                className="container"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
            >
                <div className="nav">
                    <Sosmed />
                </div>
            </motion.div>
        </>
    )
}