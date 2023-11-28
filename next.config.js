module.exports = {
  reactStrictMode: true, 
  images: {
    loader: 'akamai',
    path: '',
    domains: [
        'gjamaowmsyukioirshbv.supabase.co',
        "https://dhino12.netlify.app/"
    ],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'dhino12.netlify.app',
        port: '',
        pathname: '/account123/**',
      },
    ],
  },
  webpack: (config) => {
    config.resolve.alias.canvas = false;
    return config;
  },
}
