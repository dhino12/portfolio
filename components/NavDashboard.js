import Link  from 'next/link'

export default function NavDashboard(props) {
    console.log(props);
    return (
        <nav>
            <center>
                <h1 className="title">Dashboard</h1>
                <div className="item">
                    <Link href="/dashboard/insert">
                        <button className={(props.personal) && 'active'}>Personal Data</button>
                    </Link>
                    <Link href="/dashboard/edit">
                        <button className={props.skill && 'active'}>Skill</button>
                    </Link>
                    <Link href="/dashboard/delete">
                        <button className={props.certif && 'active'}>Certificate</button>
                    </Link>
                </div>
            </center> <br /> <br /> 
        </nav>
    )
}