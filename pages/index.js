// import Image from "next/image"; not support static next
import Lottie from "lottie-react";
import Link from "next/link";
import { motion } from "framer-motion";
import Sosmed from "../components/Sosmed";
import Header from "../components/header";
import NavHover from "../components/NavHover";
import NavClicked from "../components/NavClicked";
import animationData from "../public/asset/animation/data2.json";
import { useEffect, useState } from "react";
import {
    bgBlueVariants,
    bottomVariants,
    containerVariants,
    contentVariants,
    introVariants,
    leftVariants,
    opacityVariants,
    rightVariants,
    textContentVariants,
} from "../variants/homeVariants";
import {
    bottomLeftHoverVariants,
    bottomRightHoverVariants,
    leftHoverVariants,
    rightHoverVariants,
} from "../variants/hoverVariants";
import { bottomLeftClicked, bottomRightClicked, leftClicked, rightClicked } from "../variants/clickVariants";

export default function Home() {
    const [navHover, setNavHover] = useState({});
    const [navClicked, setnavClicked] = useState({});

    useEffect(() => {
        setTimeout(() => {
            const contentSelector = document.querySelector(".content");
            if (contentSelector) {
                contentSelector.setAttribute(
                    "style",
                    "transition: 1s ease-out;"
                );
            } 
        }, 3500);
    });

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
                <NavHover navStyle={navHover} />
                <NavClicked navStyle={navClicked} />

                <motion.div
                    className="sd-blue"
                    variants={bgBlueVariants}
                ></motion.div>
                <div className="nav">
                    <Link href="/certificate">
                        <motion.a
                            className="work"
                            variants={leftVariants}
                            onHoverStart={setNavHover.bind(
                                this,
                                leftHoverVariants
                            )}
                            onHoverEnd={setNavHover.bind(this, {})}
                            onClick={setnavClicked.bind(this, leftClicked)}
                        >
                            <h2>Certificate</h2>
                        </motion.a>
                    </Link>
                    <Link href="/repository">
                        <motion.a
                            className="repo"
                            variants={rightVariants}
                            onHoverStart={setNavHover.bind(
                                this,
                                rightHoverVariants
                            )}
                            onHoverEnd={setNavHover.bind(this, {})}
                            onClick={setnavClicked.bind(this, rightClicked)}
                        >
                            <h2>Repository</h2>
                        </motion.a>
                    </Link>
                        
                    <Sosmed />

                    <Link href="/about">
                        <motion.a
                            className="about"
                            variants={bottomVariants}
                            onHoverStart={setNavHover.bind(
                                this,
                                bottomLeftHoverVariants
                            )}
                            onHoverEnd={setNavHover.bind(this, {})}
                            onClick={setnavClicked.bind(this, bottomLeftClicked)}
                        >
                            <h2>About.</h2>
                        </motion.a>
                    </Link>
                    <Link href="/myskill">
                        <motion.a
                            className="myskill"
                            variants={bottomVariants}
                            onHoverStart={setNavHover.bind(
                                this,
                                bottomRightHoverVariants
                            )}
                            onHoverEnd={setNavHover.bind(this, {})}
                            onClick={setnavClicked.bind(this, bottomRightClicked)}
                        >
                            <h2>My Skill.</h2>
                        </motion.a>
                    </Link>
                </div>

                <motion.div
                    className="content center"
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
                    <motion.div className="right-content">
                        <motion.div variants={opacityVariants}>
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
