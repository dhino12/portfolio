module.exports = {
  reactStrictMode: true, 
  images: {
    domains: [
        'gjamaowmsyukioirshbv.supabase.co',
        "localhost"
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
