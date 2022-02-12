import Image from "next/image";
import Lottie from 'lottie-react';
import Link from "next/link";
import { useEffect, useState } from "react";
import { BsGithub, BsTelegram, BsTwitter } from 'react-icons/bs'
import { SiGmail } from 'react-icons/si'
import Header from "./components/header";
import animationData from '../public/asset/animation/data.json';

export default function Home() {
  
  const [mobileSize, setMobileSize] = useState({
    responsive: false
  })


  useEffect(() => {
    if (typeof window !== undefined) {
      function handleResize() {
        if (window.innerWidth >= 861) {
          setMobileSize({
            responsive: false
          })
        } else {
          setMobileSize({
            responsive: true
          })
        }
      }

      window.addEventListener('resize', handleResize)
    }
  }, []);
  
  return (
    <>
      <Header  />  
      <div className="container" >
        <div className="sd-blue"></div>
        <div className="nav">
          <Link href="/work"><a className="work"><h2>Work</h2></a></Link>
          <Link href="/repository"><a className="repo"><h2>Repository</h2></a></Link>
          <div className="sosmed">
            <Link href="https://github.com/Dhino12"><a><BsGithub /></a></Link>
            <Link href="/telegram"><a><BsTelegram /></a></Link>
            <Link href="https://mail.google.com/mail/?view=cm&fs=1&to=dhinorahmad0@gmail.com"><a><SiGmail /></a></Link>
            <Link href="/twitter"><a><BsTwitter /></a></Link>
            <span></span>
          </div>
          <Link href="/about"><a className="about"><h2>About.</h2></a></Link>
          <Link href="/myskill"><a className="myskill"><h2>My Skill.</h2></a></Link>
        </div>

        <div className="content">
          <div className="left-content">
            <div className="intro-text">
              <h1>Hi<span>,</span></h1>
              <p>I'm Dhino Rahmad Kusuma</p>
              <p>I design and Code simple yet beautiful websites.</p>
            </div>
          </div>
          <div className="right-content">
            <Lottie animationData={animationData} loop={true} renderer='svg' />
          </div>
        </div>
      </div>
    </>
  )
}