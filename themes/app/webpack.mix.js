const mix = require('laravel-mix');

mix.sass('src/scss/main.scss', 'dist/');

mix.options({
  processCssUrls: false,
});

if (process.env.NODE_ENV === 'production') {
  mix.minify('dist/main.css');
}
