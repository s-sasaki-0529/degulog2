const path = require('path');

module.exports = {
  // webpackが読み込むスタート地点
  entry: [
    __dirname + '/app/javascript/main.js',
    __dirname + '/app/stylesheet/application.scss',
  ],
  // ビルド後の出力先
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: 'application.js',
  },
  module: {
    loaders: [
      // .vueファイル
      { test: /\.vue$/, loader: 'vue-loader' },
      // scssファイル
      { test: /\.scss$/, loader: 'style-loader!css-loader!sass-loader' },
      // cssファイル
      { test: /\.css$/, loader: 'style-loader!css-loader' },
      // other
      {
        test: /\.(otf|eot|svg|ttf|woff|woff2)(\?.+)?$/,
        loader: 'url-loader'
      },
    ],
  },
  // vuejsを事前にコンパイル(?)
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js',
    },
  },
};
