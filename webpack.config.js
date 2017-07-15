module.exports = {
  // webpackが読み込むスタート地点
  entry: __dirname + '/app/javascript/main.js',
  // ビルド後の出力先
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: 'application.js',
  },
  // vuejsを事前にコンパイル(?)
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js',
    }
  }
}
