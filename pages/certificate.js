import { motion } from "framer-motion"
import Header from "./components/header"

export default function certifcate() {
    return (
        <>
            <Header />
            <motion.div 
                initial={{x: -500}}
                animate={{x: 0}}
                transition={{type: 'spring', delay: 0.5}}
            > 
                <h1>Hello Certificate</h1> 
            </motion.div>
        </>
    )
}