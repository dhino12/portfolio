function formatBytes(bytes, decimals = 2) {
    if (!+bytes) return '0 Bytes'

    const k = 1024
    const dm = decimals < 0 ? 0 : decimals
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']

    const i = Math.floor(Math.log(bytes) / Math.log(k))

    return `${parseFloat((bytes / Math.pow(k, i)).toFixed(dm))} ${sizes[i]}`
}

function onShowSlideChange(contentRef, queryItems, slideIndexSlider) {
    let i;
    let dots = contentRef.current.querySelectorAll(queryItems);
    for (i = 0; i < dots.length; i++) {
        // dots part
        dots[i].className = dots[i].className.replace(" repo__tabActive", "");
    }
    dots[slideIndexSlider - 1].className += " repo__tabActive";
}

function toBoolean(data) {
    console.log(data);
    if (`${data}`.toLowerCase() == "false") {
        return false
    } else {
        return true
    }
}

export { formatBytes, onShowSlideChange, toBoolean }