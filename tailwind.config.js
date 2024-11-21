/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/main/webapp/**/*.html",  // if you have HTML files
    "./src/main/webapp/**/*.jsp",   // includes JSP files like dashboard.jsp
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Figtree', ...defaultTheme.fontFamily.sans],
        cosmic: ['Cosmic', 'sans-serif'], // Add Cosmic font here
        zen: ['"Zen Dots"', 'sans-serif'], // Add Zen Dots font
      },
    },
  },
  plugins: [],
}


