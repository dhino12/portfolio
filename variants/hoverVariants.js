/* home page */

const leftHoverVariants = {
    data: {
        classHover: "hover-left",
        initial: {width: 0},
        animate: {width: 150}
    }
}

const rightHoverVariants = {
    data: {
        classHover: "hover-right",
        initial: {width: 0},
        animate: {width: 150}
    }
}

const bottomLeftHoverVariants = {
    data: {
        classHover: "hover-bottomLeft",
        initial: {height: 0},
        animate: {height: 150}
    }
}

const bottomRightHoverVariants = {
    data: {
        classHover: "hover-bottomRight",
        initial: {height: 0},
        animate: {height: 150}
    }
}
/* end home page */

export {
    leftHoverVariants,
    rightHoverVariants, 
    bottomLeftHoverVariants,
    bottomRightHoverVariants
}