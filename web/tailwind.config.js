/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'inter': ['var(--font-inter)']
      },
      backgroundImage: {
        'background': 'url(/background.svg)',
        'duo-gradient': 'linear-gradient(83deg, #9572FC 0%, #E8355F 50.52%, #E88C4E 85%);',
        'card-gradient': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 65%, rgba(0, 0, 0, 0.90) 85%);',
        'card-gradient-unranked': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 55%, #079FFA 85%);',
        'card-gradient-competitive': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 55%, #E7407F 85%);',
        'card-gradient-arcade': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 55%, #05B604 85%);',
        'card-gradient-custom_game': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 55%, #C13FE6 85%);',
      },
      backgroundColor: {
        'shape': '#2A2634'
      },
      cursor: {
        'overwatch': 'url(/cursor.svg), auto',
        'pointer': 'url(/cursor.svg), pointer'
      },
      colors: {
        'overwatch': {
          'default': 'rgba(240, 100, 20, .6)',
          'hover': 'rgba(240, 100, 20, 1)'
        },
        'unranked': {
          'default': 'rgba(7, 159, 250, .6)',
          'hover': 'rgba(7, 159, 250, 1)'
        },
        'competitive': {
          'default': 'rgba(231, 64, 127, .6)',
          'hover': 'rgba(231, 64, 127, 1)'
        },
        'arcade': {
          'default': 'rgba(5, 182, 4, .6)',
          'hover': 'rgba(5, 182, 4, 1)'
        },
        'custom_game': {
          'default': 'rgba(193, 63, 230, .6)',
          'hover': 'rgba(193, 63, 230, 1)'
        }
      }
    }
  },
  plugins: [],
}
