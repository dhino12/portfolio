import { useEffect, useRef } from "react"
import { SiGithub } from "react-icons/si";
import { left_mover, right_mover } from "../utils/slider";
import { formatBytes, onShowSlideChange } from "../utils/utils"

export default function RepoContent({ repository, setSlideIndexSlider, slideIndexSlider }) {
    const itemSlider = useRef(null);

    useEffect(() => {
        onShowSlideChange(itemSlider, "#item-slide", slideIndexSlider)
    }, [slideIndexSlider])

    const currentSlider = (n)  => {
        setSlideIndexSlider(n)
        onShowSlideChange(itemSlider, "#item-slide", slideIndexSlider)
    }

    if (repository.length == 0) return (
        <h1>Nothing</h1>
    )

    return (
        <>
            <div className="repo__content" id="item-content">
                <div className="repo__content_image">
                    <img src="/asset/png/Kiana.jpg" width={'220'} />
                </div>
                <div className="repo__content_info">
                    <h1>{repository[slideIndexSlider - 1].name}</h1>
                    <h2 data-name={repository[slideIndexSlider - 1].language}>{repository[slideIndexSlider - 1].language}</h2>
                    <p>Size : {formatBytes(repository[slideIndexSlider - 1].size)}</p>
                    <p>Created_at : {new Date(repository[slideIndexSlider - 1].created_at)
                        .toLocaleDateString('id-ID', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric'
                        })
                    }</p>
                    <a href={repository[slideIndexSlider - 1].html_url}>
                        <button className="repo__content_button">
                            <SiGithub /> Go to Project
                        </button>
                    </a>
                </div>
                <div className="repo__content_prev">
                    <a href={repository[slideIndexSlider - 1].homepage}>
                        <img src="/asset/webp/1_web_resto.webp"/>
                    </a>
                </div>
            </div>

            <div className="itemSlider">
                <button onClick={() => left_mover(itemSlider)}>
                    <img src="/asset/webp/prev_button.webp" width={65}/>
                </button>
                <div className="content_slider" ref={itemSlider}>
                    {
                        repository.map((repo, index) => (
                            <div className="repo__boxSkewLeft" key={index} style={{left: '0'}} id="item-slide" onClick={() => currentSlider(index + 1)}> 
                                <span><img src="/asset/png/Kiana.jpg" width={'120'} /></span>
                            </div>
                        ))
                    }
                </div>
                <button onClick={() => right_mover(itemSlider)}>
                    <img src="/asset/webp/next_button.webp" width={65} />
                </button>
            </div>
        </>
    )
}