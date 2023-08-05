/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'background': 'url(/background.svg)',
        'default-gradient': 'linear-gradient(83deg, #9572FC 0%, #E8355F 50.52%, #E88C4E 100%);',
        'card-gradient': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 75%, rgba(0, 0, 0, 0.90) 100%);',
        'card-gradient-unranked': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 65%, #079FFA 100%);',
        'card-gradient-competitive': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 65%, #E7407F 100%);',
        'card-gradient-arcade': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 65%, #05B604 100%);',
        'card-gradient-custom_game': 'linear-gradient(180deg, rgba(0, 0, 0, 0.00) 65%, #C13FE6 100%);',
      },
      cursor: {
        'overwatch': 'url(/cursor.svg), default'
      }
    }
  },
  plugins: [],
}
