import Image from "next/image";
import Lottie from "lottie-react";
import Link from "next/link";
import { BsGithub, BsTelegram, BsTwitter } from "react-icons/bs";
import { SiGmail } from "react-icons/si";
import { motion } from "framer-motion";
import Header from "./components/header";
import animationData from "../public/asset/animation/data.json";
import { useEffect, useState } from "react";
import useMediaQuery from "./hooks/useMediaQuery";
import {
    bgBlueVariants,
    bottomVariants,
    containerVariants, 
    contentVariants,
    introVariants,
    leftVariants,
    opacityVariants,
    rightVariants,
    sosmedVariants,
    sosmedWrapperVariants,
    textContentVariants,
} from "./variants/homeVariants";
import NavHover from "./components/navHover";

export default function Home() {
    const [navHover, setNavHover] = useState({ });

    useEffect(() => {
        setTimeout(() => {
            const contentSelector = document.querySelector('.content')
            if (contentSelector) {
                contentSelector.setAttribute('style', 'transition: 1s ease-out;')
            }
            console.log('re-render');
        }, 3500);
    })

    return (	
        <>
            <Header />
            <motion.div
                className="container"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
            > 
                {
                    navHover.left || navHover.right ? (
                        <NavHover 
                            classHover={`hover-${Object.keys(navHover)[0]}`}
                            initial={{width: 0}} 
                            animate={{width: 150}} />
                    ) : (<> </>) 
                }
                {
                    navHover.bottomLeft || navHover.bottomRight ? (
                        <NavHover 
                            classHover={`hover-${Object.keys(navHover)[0]}`}
                            initial={{height: 0}} 
                            animate={{height: '15vh'}} />
                    ) : (<> </>)
                }
                <motion.div
                    className="sd-blue"
                    variants={bgBlueVariants}
                ></motion.div>
                <div className="nav">
                    <Link href="/certificate">
                        <motion.a 
                            className="work" 
                            variants={leftVariants}
                            onHoverStart={setNavHover.bind(this, {left: true})}
                            onHoverEnd={setNavHover.bind(this, {left: false})}>
                            <h2>Certificate</h2>
                        </motion.a>
                    </Link>
                    <Link href="/repository">
                        <motion.a 
                            className="repo" 
                            variants={rightVariants}
                            onHoverStart={setNavHover.bind(this, {right: true})}
                            onHoverEnd={setNavHover.bind(this, {right: false})}>
                            <h2>Repository</h2>
                        </motion.a>
                    </Link>

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

                    <Link href="/about">
                        <motion.a className="about" variants={bottomVariants}
                            onHoverStart={setNavHover.bind(this, {bottomLeft: true})}
                            onHoverEnd={setNavHover.bind(this, {bottomLeft: false})}>
                            <h2>About.</h2>
                        </motion.a>
                    </Link>
                    <Link href="/myskill">
                        <motion.a className="myskill" variants={bottomVariants}
                            onHoverStart={setNavHover.bind(this, {bottomRight: true})}
                            onHoverEnd={setNavHover.bind(this, {bottomRight: false})}>
                            <h2>My Skill.</h2>
                        </motion.a>
                    </Link>
                </div>

                <motion.div
                    className="content"
                    variants={contentVariants}
                    initial="hidden"
                    animate="visible"
                >
                    <div className="left-content">
                        <motion.div
                            className="intro-text"
                            variants={introVariants}
                        >
                            <motion.h1 variants={textContentVariants}>
                                Hi<span>,</span>
                            </motion.h1>
                            <motion.p variants={textContentVariants}>
                                I'm Dhino Rahmad Kusuma
                            </motion.p>
                            <motion.p variants={textContentVariants}>
                                I design and Code simple yet beautiful websites.
                            </motion.p>
                        </motion.div>
                    </div>
                    <motion.div
                        className="right-content"
                    >
                        <motion.div 
                            variants={opacityVariants}
                            >
                        {/* <Image src="/asset/svg/relax.svg" layout="fill" /> */}
                        <Lottie
                            animationData={animationData}
                            loop={true}
                            renderer="svg"
                        />

                        </motion.div>
                    </motion.div>
                </motion.div>
            </motion.div>
        </>
    );
}
