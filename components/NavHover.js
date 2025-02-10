import { motion } from "framer-motion";

export default function NavHover({ navStyle }) {
    if (Object.values(navStyle).length === 0) return (<> </>)

    const dataStyle = navStyle.data

    return (
        <motion.div 
        transition={{delay: 0.5}}
        className={dataStyle.classHover}
        initial={dataStyle.initial}
        animate={dataStyle.animate}
        id="hover"> 

        </motion.div>
    )
}