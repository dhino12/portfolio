import { useState } from "react";
import { ArrowBigLeft, ArrowBigRight, Circle, CircleDot } from "lucide-react"

function CardSlider({ data, children }) {
    return (
        <div className="repo_content">
            <a target="_blank" rel="noopener noreferrer">
                <div className="repo_content_cover">
                    <Slider
                        images={data.image_path}
                    />
                </div>
                <div className="repo_content_main">
                    <h2>{data.company_name}</h2>
                    <p>{data.tech_name}</p>
                </div>
           </a>
           {children}
        </div>
    )
}


function Slider({ images }) {
    const [imageIndex, setImageIndex] = useState(0);

    function showNextImage() {
        setImageIndex((index) => {
            if (index === images.length - 1) return 0;
            return index + 1;
        });
    }

    function showPrevImage() {
        setImageIndex((index) => {
            if (index === 0) return images.length - 1;
            return index - 1;
        });
    }
    
    return (
        <section
            aria-label="Image Slider"
            style={{ width: "100%", height: "100%", position: "relative" }}
        >
            <div
                style={{
                    width: "100%",
                    height: "100%",
                    display: "flex",
                    overflow: "hidden",
                }}
            >
                {images.map((url, index) => (
                    <img
                        key={url}
                        src={`https://gjamaowmsyukioirshbv.supabase.co/storage/v1/object/public/images/${url}`}
                        alt={url}
                        aria-hidden={imageIndex !== index}
                        className="img-slider-img"
                        style={{ translate: `${-100 * imageIndex}%` }}
                    />
                ))}
            </div>
            <button
                onClick={showPrevImage}
                className="img-slider-btn"
                style={{ left: 0 }}
                aria-label="View Previous Image"
            >
                <ArrowBigLeft aria-hidden />
            </button>
            <button
                onClick={showNextImage}
                className="img-slider-btn"
                style={{ right: 0 }}
                aria-label="View Next Image"
            >
                <ArrowBigRight aria-hidden />
            </button>
            <div
                style={{
                    position: "absolute",
                    bottom: ".5rem",
                    left: "50%",
                    translate: "-50%",
                    display: "flex",
                    gap: ".25rem",
                }}
            >
                {images.map((_, index) => (
                    <button
                        key={index}
                        className="img-slider-dot-btn"
                        aria-label={`View Image ${index + 1}`}
                        onClick={() => setImageIndex(index)}
                    >
                        {index === imageIndex ? (
                            <CircleDot aria-hidden />
                        ) : (
                            <Circle aria-hidden />
                        )}
                    </button>
                ))}
            </div>
            <div id="after-image-slider-controls" />
        </section>
    );
}

export {CardSlider, Slider}