import { motion } from "framer-motion";
import Header from "../components/header";
import Sosmed from "../components/Sosmed";
import { Reveal, RevealMoveUp } from "../components/RevealContent";
import { containerVariants } from "../variants/homeVariants";
import { BsArrowDownCircle, BsArrowUpRightCircle } from "react-icons/bs";
import { useEffect, useState } from "react";
import supabase from "../libs/supabaseClient";
import { dateFormatMontDate } from "../utils/dateFormat";
import { Slider } from "../components/CardSlider";
import Link from "next/link";

function showFlowerBg(number) {
    if (number == 1) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="bg-flower"
                fill="currentColor"
                viewBox="0 0 800 800"
            >
                <path d="M951 59C902-9 412-413 399-10c-1 40 23 131 234 220-249-55-373-36-403 2-11 13-12 29-3 46 31 57 188 126 442 128-100 16-172 34-219 48-87 26-141 54-150 77-2 7-1 14 5 19 24 25 140 19 328-29-205 84-329 163-334 200-1 6 2 12 7 16 26 17 140-14 337-112-115 79-177 141-173 175 1 10 8 17 19 21 53 16 230-55 401-216 170-160 245-232 61-526z"></path>
            </svg>
        );
    }

    if (number == 2) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="bg-flower"
                fill="currentColor"
                viewBox="0 0 800 800"
            >
                <path d="M917 37C676-335 116-241 659 451c-341 163-469 452 54 274-183 343-167 767 205 148 64 226 451 601 338-271 267 16 526-234 183-322 184-141-125-226-277-6 131-515 35-890-245-237z"></path>
            </svg>
        );
    }
    if (number == 3) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="bg-flower"
                fill="currentColor"
                viewBox="0 0 800 800"
            >
                <path d="M146 789c11-23 224-68 470-98-124-9-229-35-255-82-7-12-7-26 1-37 22-29 104-52 269-36-220-79-356-215-375-303-6-30 2-55 23-69 41-29 123-15 236 35-118-83-117-97-116-104 0-5 3-9 8-11 32-13 284 123 486 273-93-126-111-259-87-324 11-33 32-51 58-52h2c36 0 76 32 117 92 235 420 29 855-337 748-104 21-191 33-245 39-49 6-212 23-234 0-4-4-5-10-3-15 4-11 35-25 93-40-100 9-106 1-110-4-2-3-3-8-1-12z"></path>
            </svg>
        );
    }
    if (number == 4) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="bg-flower"
                fill="currentColor"
                viewBox="0 0 800 800"
            >
                <path d="M1267 470c56-47-193-77-272-60 34-58 49-350-25-290C980-2 776-100 738 45 569-27 617 233 638 306c-77-54-393-130-269-25-135 60-164 481 24 535-26 94 220-130 256-157-19 115 247 414 262 329 72 138 366-29 294-153 99 8-97-192-175-245 83-4 302-87 237-120z"></path>
            </svg>
        );
    }
}

export default function About() {
    const [bgIntern, setBgIntern] = useState([""]);
    const [fields, setFields] = useState({
        name: "",
        descpersonal: "",
        desc_short: "",
        id: 0,
        birthday: "",
        id_activity: "",
        id_experience: "",
    });
    const [activity, setActivity] = useState([]);
    const [experience, setExperience] = useState([]);
    const [activeExperience, setActiveExperience] = useState("");

    useEffect(() => {
        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("user_information")
                .select(`*, activity (*),  experience (*)`)
                .single();

            if (data) {
                setFields({
                    name: data.name,
                    birthday: data.birthday,
                    descpersonal: data.about,
                    desc_short: data.short_about,
                    id: data.id_user,
                    id_activity: data.id_activity,
                    id_experience: data.id_experience,
                });
                console.log(data);
                setActivity(data.activity);
                setExperience(data.experience);
                setBgIntern(data.experience[0].image_path);
                setActiveExperience(data.experience[0].id);
            }
        };
        fetchUser();
    }, []);

    return (
        <div className="about__container">
            <Header />

            <motion.div
                className="bg-dark"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
            />

            <motion.div
                className="bg-landscape"
                initial={{ opacity: 0 }}
                animate={{ opacity: 0.03 }}
                exit={{ opacity: 0 }}
            />

            <motion.div
                className="container"
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                exit="exit"
                id="content"
            >
                <div className="nav responsive">
                    <Sosmed />
                </div>

                <header className="about__header">
                    <Reveal margin="0 auto">
                        <h1 className="text-[3em] md:text-[6em]">About Me</h1>
                    </Reveal>
                    <Reveal>
                        <p>{fields.descpersonal}</p>
                    </Reveal>
                    <Reveal slide="false" margin="0 auto">
                        <button className="about__contactMe">
                            Contact Me <BsArrowDownCircle />
                        </button>
                    </Reveal>
                </header>
                <main>
                    <div className="about__myActivity_wrapper">
                        <Reveal>
                            <h1>My Activites</h1>
                        </Reveal>
                        <div className="about__myActivity_container">
                            {activity.map((activityData) => (
                                <a href={activityData.link} target="_blank" rel="noopener noreferrer">
                                    <RevealMoveUp className="about__myActivity_content">
                                        <Reveal slide="false">
                                            <h1 className="text-4xl mb-10">{activityData.title}</h1>
                                        </Reveal>
                                        <Reveal slide="false">
                                            <h3>{activityData.tech_name}</h3>
                                        </Reveal>
                                        <Reveal slide="false">
                                            <p className="line-clamp-5 text-justify lg:line-clamp-none">{activityData.description}</p>
                                        </Reveal>
                                        <img
                                            src={activityData.image}
                                            className="bg-logo"
                                        />
                                        {showFlowerBg(
                                            Math.floor(Math.random() * 4) + 1
                                        )}
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="currentColor"
                                            className="bg-flower"
                                            viewBox="0 0 800 800"
                                        >
                                            <path d="M917 37C676-335 116-241 659 451c-341 163-469 452 54 274-183 343-167 767 205 148 64 226 451 601 338-271 267 16 526-234 183-322 184-141-125-226-277-6 131-515 35-890-245-237z"></path>
                                        </svg>
                                        <button>
                                            VIEW DETAIL <BsArrowUpRightCircle />{" "}
                                        </button>
                                    </RevealMoveUp>
                                </a>
                            ))}
                        </div>
                    </div>
                    <div className="about__myActivity_wrapper">
                        <Link href="https://www.dicoding.com/blog/selamat-kepada-pemenang-compose-migration-champion-challenge-2023/" target="_blank" rel="noopener noreferrer">
                            <div className="about__myAchievement">
                                <Reveal margin="0 auto">
                                    <h1>
                                        🏆 <br />
                                        Compose Migration Champion Challenge 2023
                                    </h1>
                                </Reveal>
                                <Reveal margin="0 auto">
                                    <h3>Google x Dicoding Indonesia </h3>
                                </Reveal>
                            </div>
                        </Link>
                    </div>
                    <div className="about__myActivity_wrapper">
                        <h1>My Intern Experience</h1>
                        <div className="about__myActivity_container">
                            <div>
                                {experience.map((experienceData) => (
                                    <article
                                        className={`about__myExperience_content ${
                                            experienceData.id ==
                                                activeExperience && "active"
                                        }`}
                                        onClick={() => {
                                            setBgIntern(
                                                experienceData.image_path
                                            );
                                            setActiveExperience(
                                                experienceData.id
                                            );
                                        }}
                                    >
                                        <li>
                                            {experienceData.location}{" "}
                                            &nbsp;&nbsp;&nbsp; ●{" "}
                                            {dateFormatMontDate(
                                                experienceData.from
                                            )}{" "}
                                            -{" "}
                                            {dateFormatMontDate(
                                                experienceData.to
                                            )}
                                        </li>
                                        <h1>{experienceData.company_name}</h1>
                                        <h3>{experienceData.tech_name}</h3>
                                    </article>
                                ))}
                            </div>
                            <div>
                                <article className="about__myExperience_content_img">
                                    <Slider images={bgIntern} />
                                </article>
                            </div>
                        </div>
                    </div>
                    <div className="about__emailme">
                        <div className="about__emailme_text">
                            <h1>
                                Could we potentially explore <br />
                                some new ideas in your inbox ?
                            </h1>
                        </div>
                        <div className="about__emailme_form">
                            <textarea placeholder="You can write something here" />
                            <button>SEND</button>
                        </div>
                        <p>
                            By clicking send you'll receive occasional emails
                            from Spotify Design. You always have the choice to
                            unsubscribe within every email you receive.
                        </p>
                    </div>
                </main>
            </motion.div>
        </div>
    );
}
