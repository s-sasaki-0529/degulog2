import http  from './http';
import degus from './degus';

http.getDegs((err, data) => {
  degus.degus = data.body;
});
