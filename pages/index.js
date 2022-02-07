import Image from "next/image";
import Link from "next/link";
import { BsGithub, BsTelegram, BsTwitter } from 'react-icons/bs'
import { SiGmail } from 'react-icons/si'
import Header from "./components/header";

export default function Home() {
  
  return (
    <>
      <Header />
      <div className="sd-white">
        <div className="container">
          <div className="container-vertical">
            <Link href="/work"><a><h2>Work</h2></a></Link>

            <div className="icons"> 
              <Link href="https://github.com/Dhino12"><a><BsGithub /></a></Link>
              <Link href="/telegram"><a><BsTelegram /></a></Link>
              <Link href="https://mail.google.com/mail/?view=cm&fs=1&to=dhinorahmad0@gmail.com"><a><SiGmail /></a></Link>
              <Link href="/gmail"><a><BsTwitter /></a></Link>
            </div>
          </div>

          <div className="container-content">
            <div className="content">
              <h2>Hi<span>,</span></h2>
              <p>I'm Dhino Rahmad Kusuma.</p>
              <p>I always try to create and write simple but easy to read and clean code.</p>
            </div>

            <Link href="/about"><a><h2 className="about">About.</h2></a></Link>
          </div>
        </div>
      </div>

      <div className="sd-blue">
        <div className="container">
          <div className="container-content">
            <div className="content">
              <Image src="/asset/svg/relax.svg" layout="fill" />
            </div>

            <Link href="/skils"><a><h2 className="about">My Skills.</h2></a></Link>
          </div>

          <div className="container-vertical">
            <Link href="/repository"><a><h2>Repository</h2></a></Link>
          </div>
        </div>
      </div>
    </>
  )
}