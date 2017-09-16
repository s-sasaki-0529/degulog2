import Vue        from 'vue';
import ElementUI  from 'element-ui'
import locale     from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-default/index.css'
import VueRouter  from 'vue-router';
import http       from './common/http';

Vue.use(ElementUI, {locale});
Vue.use(VueRouter);

// ページごとのコンポーネントを定義
const degus        = Vue.extend(require('./degus.vue'));
const measurements = Vue.extend(require('./measurements.vue'));
const boughts      = Vue.extend(require('./boughts.vue'));
const tweets       = Vue.extend(require('./tweets.vue'));

// URLに対応するコンポーネントを定義
const routes = [
  { path: '/',        component: degus },
  { path: '/measurements', component: measurements },
  { path: '/boughts', component: boughts },
  { path: '/tweets',  component: tweets },
];

// ページ全体をVueコンポーネント化
const app = new Vue({
  router: new VueRouter({routes}),
}).$mount('#app');
