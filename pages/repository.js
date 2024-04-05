import { motion } from "framer-motion";
import { useEffect, useRef, useState } from "react";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import { containerVariants } from "../variants/homeVariants";
import { FaAndroid } from "react-icons/fa";
import { IoLogoWebComponent } from "react-icons/io5";
import supabase from "../libs/supabaseClient";
import CardPortfolio from "../components/CardPortfolio";

function Repository({ dataRepo }) {
    const contentRef = useRef(null);
    const [slideIndexTab, setSlideIndexTab] = useState({
        active: 1,
        topic: "front-end-web",
    });
    const [fields, setFields] = useState([]);

    useEffect(() => {
        // onShowSlideChange(contentRef, "#item-tab", slideIndexTab.active)
        const fetchUser = async () => {
            const { data, error } = await supabase.from("portfolio").select();

            if (data) {
                setFields(data);
            }
        };
        fetchUser();
    }, [slideIndexTab]);

    // const currentSlide = (n, topic)  => {
    //     setSlideIndexTab({
    //         active: n, topic
    //     })
    //     setSlideIndexSlider(1)
    //     onShowSlideChange(contentRef, "#item-tab", slideIndexTab.active)
    // }

    return (
        <>
            <Header />

            <motion.div
                className="container repo-responsive"
                variants={containerVariants}
                ref={contentRef}
                initial="hidden"
                animate="visible"
                exit="exit"
                id="content"
            >
                {/* <div
                    className="bg-repo"
                />  */}
                <div className="nav responsive">
                    <Sosmed />
                </div>

                <div className="repo__container">
                    <div className="repo__header">
                        <div className="fc-outro-particles">
                            <div className="fc-outro-particle -t1 -v1"></div>
                            <div className="fc-outro-particle -t2 -v2"></div>
                            <div className="fc-outro-particle -t1 -v3"></div>
                            <div className="fc-outro-particle -t2 -v4"></div>
                            <div className="fc-outro-particle -t1 -v5"></div>
                        </div>
                        <div className="fc-outro-header">
                            <h1>
                                {" "}
                                List <br />
                                Project App
                            </h1>
                        </div>
                        <div className="fc-action-button">
                            <a href="#" className="fc-btn_store-ico">
                                <span className="fc-btn_store-icon">
                                    <FaAndroid />
                                </span>
                                <span className="fc-btn_store-text">
                                    <span>Android App</span>
                                </span>
                            </a>
                            <a href="#" className="fc-btn_store-ico">
                                <span className="fc-btn_store-icon">
                                    <IoLogoWebComponent />
                                </span>
                                <span className="fc-btn_store-text">
                                    <span>Web App</span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div className="repo__content">
                        <div className="repo_content_header">
                            <h1>All</h1>
                        </div>
                        <div className="repo_container_main">
                            {fields.map((portfolioData, index) => (
                                <CardPortfolio
                                    image={portfolioData.image_path}
                                    title={portfolioData.title}
                                    techName={portfolioData.tech_name}
                                    link={portfolioData.link}
                                    key={index}
                                ></CardPortfolio>
                            ))}
                        </div>

                        <div className="fc-action-button">
                            <a href="https://github.com/dhino12?tab=repositories" className="fc-btn_store-ico">
                                <span className="fc-btn_store-text">
                                    <span>More..</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </motion.div>
        </>
    );
}

Repository.getInitialProps = async (context) => {
    return {
        dataRepo: {
            data: [
                {
                    name: "",
                    topics: [],
                    created_at: "",
                },
                {
                    name: "",
                    topics: [],
                    created_at: "",
                },
            ],
        },
    };
};

export default Repository;
