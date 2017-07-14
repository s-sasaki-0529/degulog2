import request from 'superagent';

const API_BASE = '/api';
const http = {
  getDegs(callback) {
    request.get(API_BASE + '/degus').end(callback);
  }
};
export default http;
