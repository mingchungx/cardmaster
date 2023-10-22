/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        'DM Sans': ['DM Sans', 'sans-serif']
      }, 
      backgroundImage: theme => ({
        'hero-pattern': "url('/src/img/bg.png')"
      })
    },
  },
  plugins: [],
}