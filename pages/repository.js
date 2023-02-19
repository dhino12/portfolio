import { motion } from "framer-motion";
import Link from "next/link";
import { useEffect, useRef } from "react";
import { BsGithub } from "react-icons/bs";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import { useRouter } from "next/router";
import {
    sliderContentVariants,
    opacityVariants,
    opFullVariants,
    cardRepoVariants,
} from "../variants/certifVariants";
import { containerVariants } from "../variants/homeVariants";

// export async function getInitialProps() {
//     const dataReq = await fetch('https://api.github.com/users/dhino12/repos?type=owner')
//     const dataRepo = await dataReq.json(); 
    
//     return {
//         props: {
//             dataRepo
//         }
//     }
// }

function Repository({dataRepo}) {
    const contentRef = useRef(null);
    const ropesRef = useRef(null);
    const bgRepoRef = useRef(null);
    const starRepoRef = useRef(null);
    const titleRepoRef = useRef(null); 
    const router = useRouter();
    
    useEffect(() => {
        let elementContent = contentRef.current;
        let elementRopesContent = ropesRef.current;
        let elementbgRepoContent = bgRepoRef.current;
        let elementbgStarRepoContent = starRepoRef.current;
        let elementTitleRepoContent = titleRepoRef.current;
        if (elementContent === null) return;
        const slide = () => {
            elementContent.style.transform = `translateX(${-window.pageYOffset * 1.8}px)`;
            elementRopesContent.style.transform = `translateX(${-window.pageYOffset}px)`;
            elementbgRepoContent.style.transform = `translateX(${-window.pageYOffset}px)`;
            elementbgStarRepoContent.style.transform = `translateX(${-window.pageYOffset}px)`;
            elementTitleRepoContent.style.transform = `translateX(${-window.pageYOffset}px)`;
        };
        console.log(router.query);
        window.addEventListener("scroll", slide);

        return () => {
            window.removeEventListener("scroll", slide);
        };
    }, []);

    return (
        <>
            <Header />

            <motion.div
                className="container repo-responsive"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
                id="content"
            >
                <div className='title-repo' ref={titleRepoRef}>REPOSITORY</div>
                <motion.div
                    className="bg-repo"
                    ref={bgRepoRef}
                    variants={opacityVariants}
                />
                <motion.div
                    className="bg-star-repo"
                    ref={starRepoRef}
                    variants={opFullVariants}
                />
                <div className="nav">
                    <Sosmed />
                </div>

                <div className="ropes" ref={ropesRef} />
                <motion.div
                    className="content-slider"
                    ref={contentRef}
                    variants={sliderContentVariants}
                    initial="hidden"
                    animate="visible"
                    exit="exit"
                >
                    {
                        dataRepo.map(data => (
                            <>
                                {(data.topics.length !== 0) && (
                                    <motion.div className="card" variants={cardRepoVariants}>
                                        <div className="clothspin" />
                                        <h2>{data.name}</h2>
                                        <p> {data.description} </p>
                                        <div className="tag">
                                            {data.topics.map(tag => <p>#{tag}</p>)}
                                        </div>
                                        <div>
                                            <a href={data.homepage ? data.homepage : ''} target="_blank">
                                                <button>Visit</button>
                                            </a>
                                            <Link href={data.html_url}><BsGithub /></Link>
                                        </div>
                                    </motion.div>
                                )}
                            </>
                        ))
                    }
                </motion.div>
            </motion.div>
        </>
    );
}

Repository.getInitialProps = async () => {
    const dataReq = await fetch('https://api.github.com/users/dhino12/repos?type=owner')
    const dataRepo = await dataReq.json(); 
    
    return {
        dataRepo
    }   
}

export default Repository;
