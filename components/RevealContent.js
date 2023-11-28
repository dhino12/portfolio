import { useAnimation, useInView, motion } from "framer-motion"
import React, { useEffect, useRef } from "react"

export const Reveal = ({children, width = "fit-content", margin="0", slide=true}) => {
    const ref = useRef(null)
    const isInView = useInView(ref, {once: true})
    const mainControls = useAnimation()
    const slideControls = useAnimation()

    useEffect(() => {
        if (isInView) {
            mainControls.start("visible");
            slideControls.start("visible");
        }
    }, [isInView])

    return (
        <div ref={ref} style={{position: 'relative', width, overflow: 'hidden', margin: margin}}>
            <motion.div 
                variants={{
                    hidden: {opacity: 0, y: 75},
                    visible: {opacity: 1, y: 0}
                }}
                initial="hidden"
                animate={mainControls}
                transition={{duration: 0.5, delay: 0.98}}>
                {children}
            </motion.div>
            {/* Slide Effect */}
            {slide == true && (
                <motion.div 
                    variants={{
                        hidden: {left: 0},
                        visible: {left: "100%"}
                    }}
                    initial="hidden"
                    animate={slideControls}
                    transition={{duration: 0.5, ease: "easeInOut", delay: 0.8}}
                    style={{
                        position: "absolute",
                        top: 4,
                        bottom: 4,
                        left: 0,
                        right: 0,
                        background: "#0aff9d",
                        zIndex: 20  
                    }}>

                </motion.div>
            )}
        </div>
    )
}

export const RevealMoveUp = ({children, className}) => {
    const ref = useRef(null)
    const isInViewUp = useInView(ref, {once: true})
    const moveUpControls = useAnimation()

    useEffect(() => {
        if (isInViewUp) {
            moveUpControls.start("visible");
        }
    }, [isInViewUp])

    
    return (
        <div ref={ref} style={{position: 'relative', overflow: 'hidden'}} className={className}>
            <motion.article
                variants={{
                    hidden: {opacity: 0, y: 50},
                    visible: {opacity: 1, y: 0}
                }}
                initial="hidden"
                animate={moveUpControls}
                transition={{duration: 0.5}}>
                {children}
            </motion.article>
        </div>
    )
}