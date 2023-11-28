import Image from "next/image";
import Link from "next/link";

export default function CardPortfolio({ image, title, techName, link, children }) {
    return (
        <div className="repo_content">
            <a target="_blank" href={link} rel="noopener noreferrer">
                <div className="repo_content_cover">
                    <img style={{
                        display: 'block',
                        background: `url('https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/images/${image}') center top / cover no-repeat`,
                        width: '100%',
                        height: '100%',
                    }} loading="lazy" />
                </div>
                <div className="repo_content_main">
                    <h2>{title}</h2>
                    <p>{techName}</p>
                </div>
           </a>
           {children}
        </div>
    )
}