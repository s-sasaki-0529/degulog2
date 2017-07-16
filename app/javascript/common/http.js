import request from 'superagent';

const API_BASE = '/api';
const http = {
  // デグー一覧を取得
  getDegs(callback) {
    request.get(API_BASE + '/degus').end(callback);
  },
  // 体重記録一覧を取得
  getWeights(callback) {
    request.get(API_BASE + '/weights').end(callback);
  },
};
export default http;
