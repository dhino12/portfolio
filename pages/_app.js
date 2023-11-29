import { AnimatePresence } from 'framer-motion'
import '../styles/globals.css'
import '../styles/home.scss'
import '../styles/certificate.scss'
import '../styles/background.css'
import '../styles/modal.css'
import '../styles/mediaQuery/homeResponsive.scss'
import '../styles/mediaQuery/certifResponsive.scss'
import '../styles/mediaQuery/repoResponsive.scss'
import '../styles/mediaQuery/aboutResponsive.scss'
import '../styles/repo.scss'
import '../styles/about.scss'
import '../styles/mediaQuery/repo.scss'
import '../styles/dashboard/personal.scss'
import '../styles/dashboard/auth.scss'
import '../styles/slider/image-slider.css'
import { route } from 'next/dist/server/router'
import App from 'next/app'
import React from 'react'
import Head from 'next/head'

export default class MyApp extends App {
  // const isBrowser = typeof window !== 'undefined'
  // if (!isBrowser) return (
  //   <Component {...pageProps} key={router.route} />
  // );
  static async getInitialProps({ Component, router, ctx }) {
    let pageProps = {};

    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx);
    }

    return { pageProps };
  }
  render() {
    const { Component, pageProps } = this.props;

    const Layout = Component.layout || (({ children }) => <>{children}</>);

    return (
      <React.Fragment>
        <Head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
          />
          <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
          <meta name="description" content="Restaurant-Catalogue"/>
          <link rel="preconnect" href="https://restaurant-api.dicoding.dev"></link>
          <title>Dhino Rahmad</title>
        </Head>
        <Layout>
          <Component {...pageProps} />
        </Layout>
      </React.Fragment>
    );
  }
}
