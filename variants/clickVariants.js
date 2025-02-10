const leftClicked = {
    data: {
        classHover: "hover-left",
        initial: {width: 0},
        animate: {width: '100%'},
        transition: {
            duration: 1,
            ease: 'easeInOut',
        },
        style: {
            zIndex: 2,
        }
    }
}

const rightClicked = {
    data: {
        classHover: "hover-right",
        initial: {width: 0},
        animate: {width: '100%'},
        transition: {
            duration: 1,
            ease: 'easeInOut',
        },
        style: {
            zIndex: 2,
        }
    }
}

const bottomLeftClicked = {
    data: {
        classHover: "hover-bottomLeft",
        initial: {height: 0},
        animate: {height: '100vh'},
        transition: {
            duration: 1,
            ease: 'easeInOut',
        },
        style: {
            zIndex: 10,
        }
    }
}

const bottomRightClicked = {
    data: {
        classHover: "hover-bottomRight",
        initial: {height: 0},
        animate: {height: '100vh'},
        transition: {
            duration: 1,
            ease: 'easeInOut',
        },
        style: {
            zIndex: 2,
        }
    }
}

export {
    leftClicked, rightClicked, bottomLeftClicked, bottomRightClicked
}