import { AnimatePresence } from 'framer-motion'
import '../styles/globals.css'
import '../styles/home.scss'
import '../styles/mediaQuery/homeResponsive.scss'

function MyApp({ Component, pageProps, router }) {
  return (
    <AnimatePresence exitBeforeEnter>
      <Component {...pageProps} key={router.route} />
    </AnimatePresence>
  )
}

export default MyApp
