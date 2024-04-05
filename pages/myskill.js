import { motion } from "framer-motion";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import mySkill from "../data/myskill";
import { containerVariants } from "../variants/homeVariants";

export default function MySkill() {
    return (
        <>
            <Header />

            <motion.div 
                className="bg-lightYellow"
                initial={{boxShadow: 0}}
                animate={{boxShadow: 'inset 0px 0px 150px #fcc4a0'}} />

            <motion.div 
                className="container"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit">
                <div className="nav">
                    <Sosmed />
                </div>

                <div className="content-myskill frame">
                    <div className="skill">
                        <center><h2>Front-end Developer</h2></center>
                        <p>{mySkill.desc}</p>
                        <h2>Skill</h2>
                        <p>{mySkill.skills}</p>
                        <h2>Tools</h2>
                        <p>{mySkill.tools}</p>
                        <h2>Plan</h2>
                        <p>{mySkill.plan}</p>
                    </div>
                </div>
            </motion.div>
        </>
    )
}