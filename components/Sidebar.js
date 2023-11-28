import Link from "next/link";
import { useMemo } from "react";
import { useRouter } from 'next/router'
import { IoIosLogOut } from "react-icons/io";

export default function Sidebar({ logoutHandler }) {
    const router = useRouter()
    const pathname = router.pathname
    
    const routes = useMemo(() => [
        {
            label: 'Home',
            active: pathname === '/dashboard/personal',
            href: '/dashboard/personal'
        },
        {
            label: 'Portfolio',
            active: pathname === '/dashboard/portfolio',
            href: '/dashboard/portfolio'
        },
        {
            label: 'Certificate',
            active: pathname === '/dashboard/certificate',
            href: '/dashboard/certificate'
        },
        {
            label: 'Experience',
            active: pathname === '/dashboard/experience',
            href: '/dashboard/experience'
        },
        {
            label: 'Blog',
            active: pathname === '/dashboard/blog',
            href: '/dashboard/blog'
        },
    ], [pathname]);
    return (
        <div className="sidebar">
            <table>
                <thead>
                    <Link href="/">
                        <tr className="dashboard-title">
                            <td>
                                .D.
                            </td>
                            <td>
                                ashboard
                            </td>
                        </tr>
                    </Link>
                </thead>
                <tbody>
                    {routes.map((item, index) => 
                        <Link href={item.href} key={index}>
                            <tr className={`sidebar-${item.active && "active"}`}><td>{item.label}</td></tr>
                        </Link>
                    )}
                </tbody>
            </table>
            <button className="logout" onClick={() => logoutHandler()}>Logout <IoIosLogOut /></button>
        </div>
    )
}