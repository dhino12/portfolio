import { useRouter } from "next/router"
import Sidebar from "../components/Sidebar"
import { useEffect } from "react"
import supabase from "../libs/supabaseClient"

export default function Dashboard({ children }) {
    // console.log(Object.keys(children.props)[0]);
    const router = useRouter()
    useEffect(() => {
        if (!sessionStorage.getItem("auth")) return router.push("/dashboard");
    }, [])

    async function logoutHandler() {
        await supabase.auth.signOut();
        sessionStorage.removeItem("auth")
        router.push("/dashboard")
    }

    return (
        <>
        <div className="dashboard-container">
            <Sidebar
                logoutHandler={logoutHandler}
            />
            <div className="container-content">
                {children}
            </div>
        </div>
        <footer>
            <p>
                ©Portfolio 2023
            </p>
            <p>Made with ❤ from Dhino Rahmad.</p>
        </footer>
        </>
    )
}