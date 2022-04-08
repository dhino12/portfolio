import Link  from 'next/link'

export default function NavDashboard() {
    return (
        <nav>
            <center>
                <h1 className="title">Dashboard</h1>
                <div className="item">
                    <Link href="/dashboard/insert">
                        <button>Personal Data</button>
                    </Link>
                    <Link href="/dashboard/edit">
                        <button>Skill</button>
                    </Link>
                    <Link href="/dashboard/delete">
                        <button>Certificate</button>
                    </Link>
                </div>
            </center> <br /> <br /> 
        </nav>
    )
}