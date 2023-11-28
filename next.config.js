module.exports = {
  reactStrictMode: true, 
  images: {
    unoptimized: true,
    domains: [
        'gjamaowmsyukioirshbv.supabase.co',
        "localhost",
        "https://dhino12.netlify.app/"
    ],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'assets.example.com',
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
