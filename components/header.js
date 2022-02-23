import Link from "next/link";

export default function Header() {
    return (
        <header>
            <Link href="/"><a><h1 className="logo">.D.</h1></a></Link>
            <h2 className="sayHello">Say Hi....</h2>

            <button type="submit"> Light </button>
        </header>
    )
}