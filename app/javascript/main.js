import Vue        from 'vue';
import VueRouter  from 'vue-router';
import http       from './http';
Vue.use(VueRouter);

// ページごとのコンポーネントを定義
const Degus   = { template: '<div>Degus</div>' };
const Weights = { template: '<div>Weights</div>' };
const Boughts = { template: '<div>Boughts</div>' };
const Tweets  = { template: '<div>Tweets</div>' };

// URLに対応するコンポーネントを定義
const routes = [
  { path: '/',        component: Vue.extend(require('./degus.vue')) },
  { path: '/weights', component: Vue.extend(require('./weights.vue')) },
  { path: '/boughts', component: Vue.extend(require('./boughts.vue')) },
  { path: '/tweets',  component: Vue.extend(require('./tweets.vue')) },
];

// ページ全体をVueコンポーネント化
const app = new Vue({
  router: new VueRouter({routes}),
}).$mount('#app');
