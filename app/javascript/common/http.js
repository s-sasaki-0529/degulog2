import request from 'superagent';

const API_BASE = '/api';
const http = {
  // デグー一覧を取得
  getDegs(callback) {
    request.get(API_BASE + '/degus').end(callback);
  },
  // 体重記録一覧を取得
  getMeasurements(callback) {
    request.get(API_BASE + '/measurements').end(callback);
  },
  // 購入記録一覧を取得
  getBoughts(callback) {
    request.get(API_BASE + '/boughts').end(callback);
  },
  // ツイート一覧を取得(キャッシュ)
  getTweets(callback) {
    request.get(API_BASE + '/tweets').end(callback);
  },
  // ツイート一覧を取得(最新)
  getLatestTweets(callback) {
    request.get(API_BASE + '/tweets').query({latest: true}).end(callback);
  },
};
export default http;
