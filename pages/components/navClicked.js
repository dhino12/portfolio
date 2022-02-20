import { motion } from "framer-motion"

export default function NavClicked ({ navStyle }) {
    if (Object.values(navStyle).length === 0) return (<> </>)

    let dataStyle = navStyle.data
    console.log(dataStyle);

    return (
        <motion.div 
        className={dataStyle.classHover}
        initial={dataStyle.initial}
        animate={dataStyle.animate}
        transition={dataStyle.transition}
        style={dataStyle.style}
        id="hover"> 

        </motion.div>
    )
}