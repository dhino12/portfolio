import { motion } from "framer-motion"
import Link from "next/link"
import { sosmedVariants, sosmedWrapperVariants } from "../variants/homeVariants"
import { BsGithub, BsTelegram, BsTwitter } from "react-icons/bs";
import { SiGmail } from "react-icons/si";

export default function Sosmed () {
    return (
        <motion.div
            className="sosmed"
            variants={sosmedWrapperVariants}
        >
            <Link href="https://github.com/Dhino12">
                <motion.a variants={sosmedVariants}>
                    <BsGithub />
                </motion.a>
            </Link>
            <Link href="/telegram">
                <motion.a variants={sosmedVariants}>
                    <BsTelegram />
                </motion.a>
            </Link>
            <Link href="https://mail.google.com/mail/?view=cm&fs=1&to=dhinorahmad0@gmail.com">
                <motion.a variants={sosmedVariants}>
                    <SiGmail />
                </motion.a>
            </Link>
            <Link href="/twitter">
                <motion.a variants={sosmedVariants}>
                    <BsTwitter />
                </motion.a>
            </Link>
            <motion.span
                initial={{ y: "10vh" }}
                animate={{ y: 0 }}
            ></motion.span>
        </motion.div>
    )
}