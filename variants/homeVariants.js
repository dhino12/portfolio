const sosmedWrapperVariants = {
    hidden: {
        scale: 0,
    },
    visible: {
        scale: 1,
        transition: {
            type: "spring",
            mass: 0.4,
            damping: 8,
            when: "beforeChildren",
            staggerChildren: 0.4,
        },
    }
};

const containerVariants = {
    hidden: { 
        opacity: 0
    },
    visible: { 
        opacity: 1,
        transition: {
            type: "fill",
            when: "beforeChildren",
            staggerChildren: 0.6
        },
    },
    exit: {
        opacity: 0,
        transition: {duration: 1},
    },
};

const introVariants = {
    hidden: {
        scale: 0,
    },
    visible: {
        scale: 1,
        transition: {
            type: "spring",
            mass: 0.2,
            damping: 4,
            when: "beforeChildren",
            staggerChildren: 1,
        },
    },
};

const contentVariants = {
    hidden: {
        opacity: 0,
        height: 0,
    },
    visible: {
        opacity: 1,
        height: 495,
        transition: {
            type: "spring",
            mass: 1.9,
            damping: 10,
            when: "beforeChildren",
            staggerChildren: 0.5,
            ease: 'easeInOut'
        },
    },
    exit: {
        scale: 0
    }
};

const textContentVariants = {
    hidden: {
        opacity: 0,
    },
    visible: {
        opacity: 1,
    },
};

const sosmedVariants = {
    visible: {
        scale: 1
    },
    hidden: {
        scale: 0,
    },
};

const opacityVariants = {
    visible: {
        opacity: 1,
    },
    hidden: {
        opacity: 0,
    },
};

const bgBlueVariants = {
    visible: {
        height: "100vh",
    },
    hidden: {
        height: 0,
    },
    exit: {
        height: 0,
    }
};

const leftVariants = {
    hidden: {
        x: "-20vw",
        rotate: "90deg",
    },
    visible: {
        x: 0,
        rotate: "90deg",
    },
};

const rightVariants = {
    hidden: {
        x: "20vw",
        rotate: "90deg",
    },
    visible: {
        x: 0,
        rotate: "90deg",
    },
};

const bottomVariants = {
    hidden: {
        y: "20vw",
    },
    visible: {
        y: 0,
    },
};

export {
    sosmedWrapperVariants,
    sosmedVariants,
    containerVariants,
    introVariants,
    contentVariants,
    textContentVariants,
    opacityVariants, leftVariants,
    rightVariants, 
    bottomVariants, bgBlueVariants
};
