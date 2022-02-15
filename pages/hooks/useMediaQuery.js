import { useEffect, useState } from "react";

export default function useMediaQuery(query) {
    const [matches, setMatches] = useState(false);

    useEffect(() => {
        if (window == undefined) return
        const media = window.matchMedia(query);
        if (media.matches !== matches) {
            setMatches(media.matches)
        }
        const listener = () => {
            setMatches(media.matches);
        }
        media.addListener(listener);
        return () => media.removeListener(listener)
    })
    return matches;
}