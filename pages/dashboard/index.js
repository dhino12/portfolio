import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import Link from "next/link";

import supabase from "../../libs/supabaseClient";
import { Auth } from "@supabase/auth-ui-react";
import { ThemeSupa } from "@supabase/auth-ui-shared";

import { FaGithub, FaLinkedin } from "react-icons/fa";

const Index = () => {
    const router = useRouter();

    useEffect(() => {
        if (sessionStorage.getItem("auth")) return router.push("/dashboard/personal");

        supabase.auth.getSession().then(({ data: { session } }) => {
            if (session?.user == undefined) return
            console.log('getSession(): ' + session.user.id);
            sessionStorage.setItem("auth", session.user.id);
        });

        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange((_event, session) => {
            if (session?.user == undefined) return
            sessionStorage.setItem("auth", session.user.id);
            router.push("/dashboard/personal")
        });
        return () => subscription.unsubscribe();
    }, []);

    return (
        <div className="container d-flex justify-content-space-between flex-column bg-auth">
            <header className="w-unset d-flex justify-content-space-between flex-row p-relative align-item-center m-horizontal-10-large">
                <div className="header-content">
                    <h1>Dhino Rahmad</h1>
                </div>
                <div className="navigation-header-content">
                    <a href={"https://github.com/Dhino12"} target="_blank">
                        <FaLinkedin style={{ width: "20px", height: "20px" }} />
                    </a>
                    <a href={"https://github.com/Dhino12"}>
                        <FaGithub style={{ width: "20px", height: "20px" }} />
                    </a>
                    <button>Hello</button>
                </div>
            </header>
            <main className="container-auth">
                <div className="content-auth">
                    <Auth
                        magicLink
                        providers={["github"]}
                        supabaseClient={supabase}
                        appearance={{
                            theme: ThemeSupa,
                            variables: {
                                default: {
                                    colors: {
                                        brand: "#404040",
                                        brandAccent: "#22c55e",
                                    },
                                },
                            },
                        }}
                    />
                </div>
            </main>
            <footer className="auth-footer">
                <p>
                    ©Portfolio 2023
                </p>
                <p>Made with ❤ from Dhino Rahmad.</p>
            </footer>
        </div>
    );
};

export default Index;
