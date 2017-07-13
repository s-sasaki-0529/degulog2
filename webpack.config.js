module.exports = {
  entry: __dirname + '/app/javascript/degus.js',
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: 'application.js',
  },
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js',
    }
  }
}
