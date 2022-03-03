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

const contentVariants = {
    hidden: {
        opacity: 0,
    },
    visible: {
        opacity: 1,
        transition: {
            type: "spring",
            mass: 0.9,
            damping: 10,
            when: "beforeChildren",
            staggerChildren: 0.5,
            ease: 'easeInOut'
        },
    },
    exit: {
        scale: 0
    }
}

const cardVariants = {
    hidden: {
        scale: 0
    },
    visible: {
        scale: 1
    }
}

const opacityVariants = {
    hidden: {
        opacity: 0
    },
    visible: {
        opacity: 0.3
    }
}
const opFullVariants = {
    hidden: {
        opacity: 0
    },
    visible: {
        opacity: 1
    }
}

const cardRepoVariants = {
    hidden: {
        opacity: 0,
        y: -10
    },
    visible: {
        opacity: 1,
        y: 0
    }
}

const sliderContentVariants = {
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
    }
}

export {
    contentVariants, containerVariants, cardVariants, opacityVariants, opFullVariants, sliderContentVariants, cardRepoVariants
}