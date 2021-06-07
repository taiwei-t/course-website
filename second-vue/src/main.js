import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store'
import {findAllMenus} from "./config/menu";
import "./common/style.css"
import BaiduMap from 'vue-baidu-map'  //百度地图API
Vue.use(BaiduMap, {
    ak: 'imumHNUWeAFwzoORRw7cvgPAEdVw73iy'
})
Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.use(ElementUI)

router.beforeEach((to,from,next)=> {
    if(to.path === '/admin'){
        next();
    } else if(to.path.startsWith('/admin')) {
        if (window.sessionStorage.getItem("user")) {
            findAllMenus(router,store)
            next();
	    } else {
            next("/?redirect="+to.path)
        }
    } else if(to.path === '/'){
        next("/home")
    } else {
        next();
    }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
