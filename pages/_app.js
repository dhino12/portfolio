import { AnimatePresence } from 'framer-motion'
import '../styles/globals.css'
import '../styles/home.scss'
import '../styles/certificate.scss'
import '../styles/background.css'
import '../styles/mediaQuery/homeResponsive.scss'
import '../styles/mediaQuery/certifResponsive.scss'
import '../styles/mediaQuery/repoResponsive.scss'
import '../styles/mediaQuery/aboutResponsive.scss'

function MyApp({ Component, pageProps, router }) {
  return (
    <AnimatePresence exitBeforeEnter>
      <Component {...pageProps} key={router.route} />
    </AnimatePresence>
  )
}

export default MyApp
