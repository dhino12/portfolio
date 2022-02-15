import { motion } from "framer-motion";

export default function NavHover(props) {
    return (
        <motion.div 
        transition={{delay: 0.5}}
        className={props.classHover}
        initial={props.initial}
        animate={props.animate}
        id="hover"> 

        </motion.div>
    )
}