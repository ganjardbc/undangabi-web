module.exports = {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    extend: {
      colors: {
        canvas: '#faf9f5',
        primary: {
          DEFAULT: '#cc785c',
          active: '#a9583e',
          disabled: '#e6dfd8',
        },
        accent: {
          amber: '#d4a853',
        },
        ink: '#141413',
        body: {
          strong: '#252523',
          DEFAULT: '#3d3d3a',
        },
        muted: {
          DEFAULT: '#6c6a64',
          soft: '#8e8b82',
        },
        // on-dark color tokens for dark background sections
        'on-dark': '#f0ede8',
        'on-dark-soft': '#a09a92',
        surface: {
          soft: '#f5f0e8',
          card: '#efe9de',
          strong: '#e8e0d2',
          dark: '#181715',
          'dark-elevated': '#252320',
          'dark-soft': '#1f1e1b',
        },
        hairline: {
          DEFAULT: '#e6dfd8',
          soft: '#ebe6df',
        },
        success: '#5db872',
        warning: '#d4a017',
        error: '#c64545',
      },
      fontFamily: {
        playfair: ["'Playfair Display'", 'Georgia', 'serif'],
        display: ["'Cormorant Garamond'", 'Garamond', "'Times New Roman'", 'serif'],
        sans: ['Inter', '-apple-system', 'BlinkMacSystemFont', "'Segoe UI'", 'Roboto', 'sans-serif'],
        mono: ["'JetBrains Mono'", 'Monaco', 'Consolas', 'monospace'],
      },
      borderRadius: {
        xs: '4px',
        sm: '6px',
        md: '8px',
        lg: '12px',
        xl: '16px',
      },
    },
  },
  plugins: [],
}
