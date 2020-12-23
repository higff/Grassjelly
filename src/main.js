import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import moment from 'moment'
import qs from 'qs'
axios.defaults.baseURL = 'http://127.0.0.1:5050';
Vue.prototype.axios = axios;
Vue.prototype.moment = moment;
Vue.prototype.qs = qs;
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
