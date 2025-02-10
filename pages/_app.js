import { AnimatePresence } from 'framer-motion'
import Dashboard from "../layouts/Dashboard";
import '../styles/globals.css'
import '../styles/styles_about.css'
import '../styles/styles_repo.css'
import '../styles/home.scss'
import '../styles/certificate.scss'
import '../styles/background.css'
import '../styles/modal.css'
import '../styles/mediaQuery/homeResponsive.scss'
import '../styles/mediaQuery/certifResponsive.scss'
import '../styles/about.scss'
import '../styles/dashboard/personal.scss'
import '../styles/dashboard/auth.scss'
import '../styles/slider/image-slider.css'

import React from 'react'
import Head from  'next/head'

function MyApp({ Component, pageProps, router }) {
  // Terapkan layout hanya jika berada di dalam "/dashboard/"
  const isDashboardPage = router.pathname.startsWith("/dashboard") && router.pathname.split("/").length > 2;
  const Layout = isDashboardPage ? Dashboard : React.Fragment;

  return (
    <Layout>
        <Head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
          />
          <meta httpEquiv="X-UA-Compatible" content="IE=edge"></meta>
          <meta name="description" content="Portfolio-Dhino-Rahmad"/> 
          <title>Dhino Rahmad</title>
        </Head>
        <AnimatePresence exitBeforeEnter>
          <Component {...pageProps} key={router.route} />
        </AnimatePresence>
    </Layout>
  )
}

export default MyApp
