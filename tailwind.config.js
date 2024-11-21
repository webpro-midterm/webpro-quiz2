/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/main/webapp/**/*.html",  // if you have HTML files
    "./src/main/webapp/**/*.jsp",   // includes JSP files like dashboard.jsp
  ],
  theme: {
    extend: {
      fontFamily: {
        cosmic: ['Cosmic', 'sans-serif'], // Cosmic font
        zen: ['"Zen Dots"', 'sans-serif'], // Zen Dots font
      },
    },
  },
  plugins: [],
}
