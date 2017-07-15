import Vue        from 'vue';
import VueRouter  from 'vue-router';
import http       from './http';
Vue.use(VueRouter);

// ページごとのコンポーネントを定義
const Top     = { template: '<div>Top</div>' };
const Degus   = { template: '<div>Degus</div>' };
const Weights = { template: '<div>Weights</div>' };
const Boughts = { template: '<div>Boughts</div>' };
const Tweets  = { template: '<div>Tweets</div>' };

// URLに対応するコンポーネントを定義
const routes = [
  { path: '/',        component: Top   },
  { path: '/degus',   component: Degus },
  { path: '/weights', component: Weights },
  { path: '/boughts', component: Boughts },
  { path: '/tweets',  component: Tweets },
];

// ページ全体をVueコンポーネント化
const app = new Vue({
  router: new VueRouter({routes}),
}).$mount('#app');
