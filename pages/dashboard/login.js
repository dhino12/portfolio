import Router from "next/router";
import { useState } from "react";
import { auth } from "../../middleware/authorization";

export async function getServerSideProps(ctx) {
    await auth(ctx)

    return {
        props: {}
    }
}

export default function Login() {

    const [fields, setFields] = useState({
        username: '',
        password: '',
    })

    const [status, setStatus] = useState('');

    async function loginHandler(e) {
        e.preventDefault();
        console.log(fields);
        const loginRequest = await fetch('/api/posts/login', {
            method: 'POST',
            body: JSON.stringify(fields),
            headers: { 'Content-Type': 'application/json' }
        })

        if (!loginRequest.ok) return setStatus(`error: ${loginRequest.status}`);

        const loginRes = await loginRequest.json();
        console.log(loginRes);
        setStatus('success');
        document.cookie= 'username=data;'
        Router.push('/dashboard/personal')
    }

    function fieldHandler(e) {
        const attrib = e.target.getAttribute('name');

        setFields({
            ...fields,
            [attrib]: e.target.value
        })
        setStatus('')
        console.log(fields);
    }

    return (
        <>
            { status.includes('error') && (alert('Username & Password salah')) }

            <div className="container-input">
                <div className="content-input">
                    <center>
                        <h1 className="title">Login</h1>
                    </center> <br/><br/>
                    <form onSubmit={loginHandler.bind(this)}>
                        <label name="username">Username</label>
                        <input onChange={fieldHandler.bind(this)} name="username" type="text" placeholder="input username" />

                        <label name="password">Password</label>
                        <input onChange={fieldHandler.bind(this)} name="password" type="password" placeholder="input password" />

                        <button type="submit">Login</button>
                    </form>
                </div>
            </div>
        </>
    )
}