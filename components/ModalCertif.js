import { useEffect, useRef } from "react"
import { GrNext, GrPrevious } from 'react-icons/gr'
import { motion } from "framer-motion";

export default function ModalCertif ({ dataCertif, setData}) {   
    if (Object.keys(dataCertif).length === 0 || dataCertif.foto === undefined) {
        console.log('masuk');
        return (<> </>)
    }

    let counter = 0;
    const imgSlide = useRef(null)
    const prev = useRef(null)
    const next = useRef(null)

    if (window.innerWidth <= 992) {
        alert('Maaf gunakan PC/Laptop untuk melihat review dan mendownload certificate')
        return (<> </>)
    }
    
    useEffect(() => {
        const img = document.querySelectorAll('.img-slide .img');
        if (img === undefined) return next.current.removeEventListener()

        const size = img[0].clientWidth;
        let elementImageSlide = imgSlide.current;
        let elementNext = next.current
        let elementPrev = prev.current
        
        const slideIncrement = () => {
            if (counter >= img.length -1) return
            elementImageSlide.style.transition = `transform 0.4s ease-in-out`;
            counter++
            elementImageSlide.style.transform = `translateX(${(-size * counter + 100)}px)`;
            console.log(counter);
        }
        
        const slideDecrement = () => {
            if (counter <= 0) return
            elementImageSlide.style.transition = `transform 0.4s ease-in-out`;
            counter--
            elementImageSlide.style.transform = `translateX(${(-size * counter)}px)`;
            console.log(counter);
        }
        elementNext.addEventListener('click', slideIncrement)    

        elementPrev.addEventListener('click', slideDecrement)

        return () => {
            elementNext.removeEventListener('click', slideIncrement)
            elementPrev.removeEventListener('click', slideDecrement)
        }
    },[])

    return (
        <motion.div 
            className="modal-wrapper"
            initial={{opacity: '0'}}
            animate={{opacity: '1'}}
            exit={{opacity: '0'}}
        >
            <motion.div 
                className="modal-content"
                initial={{top: '-80%'}}
                animate={{top: '10%'}}
                exit={{top: '-80%'}}>
                <div className="side" ref={prev}><GrPrevious /></div>
                <div className="img-wrapper">
                    <div className="img-slide" ref={imgSlide}>
                        {dataCertif.foto.map((foto, index) => (
                            <div className='img' key={index} style={{backgroundImage: `url("${foto}")`}}/>    
                    ))}
                    </div>
                </div>
                <div className="side" ref={next}><GrNext /></div>
                <div className="button">
                    <button>unduh</button>
                    <button>QRCode</button>
                    <button onClick={setData.bind({})}>Close</button>
                </div>
            </motion.div>
        </motion.div>
    )
}