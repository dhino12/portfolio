// TODO buat boxShadow mengikuti mouse

function mouseTracker(wrapperRef, contentRef, element) {
    // wrappeRef => container Content
    // contentRef => content yang ingin diberi boxShadow
    // element => element ketika event mouseMove
    const shadowMax = wrapperRef.current.clientHeight;
    const shadowMin = shadowMax * -1;
    const shadowMidPoint = [
        wrapperRef.current.clientLeft + wrapperRef.current.clientWidth,
        wrapperRef.current.clientTop + wrapperRef.current.clientHeight,
    ]

    let shadowX = Math.max(shadowMin, shadowMidPoint[0] - element.pageX * 2) * 0.01;
    let shadowY = Math.max(shadowMin, shadowMidPoint[1] - element.pageY * 2) * 0.01;
    contentRef.current.style.boxShadow = `${shadowX}px ${shadowY}px `
}

export default mouseTracker