import { motion } from "framer-motion";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import { containerVariants } from "../variants/homeVariants";
import { GrClose } from 'react-icons/gr'
import Link from "next/link";

export default function About() {
    return (
        <>
            <Header />

            <motion.div 
                className="bg-darkYellow"
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}} />

            <motion.div 
                className="bg-landscape"
                initial={{opacity: 0}}
                animate={{opacity: 0.3}}
                exit={{opacity: 0}} />
                
            <motion.div
                className="container"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
                id="content"
            >
                <div className="nav">
                    <Sosmed />
                </div>

                <div className="windowProgram">
                    <div className='programName'><h2>Dhino Rahmad Kusuma </h2></div>
                    <Link href='/'><a><div className="close"> <GrClose /> </div></a></Link>
                    <div className="contentProgram">
                        <p>I'm a front-end developer located in Indonesia. I love to create simple yet beautiful websites with great user experience.
I'm interested in the whole frontend stack Like trying new things and building great projects. I'm an independent freelancer and blogger. I love to write blogs and read books.
I believe everything is an Art when you put your consciousness in it. You can connect with me via social links.</p>
                    </div>
                </div>
            </motion.div>
        </>
    )
}