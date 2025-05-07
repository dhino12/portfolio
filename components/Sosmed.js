import { motion } from "framer-motion"
import Link from "next/link"
import { sosmedVariants, sosmedWrapperVariants } from "../variants/homeVariants"
import { BsGithub, BsTelegram, BsTwitter } from "react-icons/bs";
import { FaGitlab } from "react-icons/fa";
import { SiGmail } from "react-icons/si";

export default function Sosmed () {
    return (
        <motion.div
            className="sosmed"
            variants={sosmedWrapperVariants}
        >
            <motion.div variants={sosmedVariants}>
                <Link href="https://gitlab.com/dhino12">
                    <a>
                        <FaGitlab />
                    </a>
                </Link>
            </motion.div>
            <motion.div variants={sosmedVariants}>
                <Link href="https://github.com/Dhino12">
                    <a>
                        <BsGithub />
                    </a>
                </Link>
            </motion.div>

            <motion.div variants={sosmedVariants}>
                <Link href="https://t.me/dhino_rahmad">
                    <a>
                        <BsTelegram />
                    </a>
                </Link>
            </motion.div>

            <motion.div variants={sosmedVariants}>
                <Link href="https://mail.google.com/mail/?view=cm&fs=1&to=dhinorahmad0@gmail.com">
                    <a>
                        <SiGmail />
                    </a>
                </Link>
            </motion.div>

            <motion.div variants={sosmedVariants}>
                <Link href="/">
                    <a>
                        <BsTwitter />
                    </a>
                </Link>
            </motion.div>

            <motion.span
                initial={{ y: "10vh" }}
                animate={{ y: 0 }}
            ></motion.span>
        </motion.div>
    )
}