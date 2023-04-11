import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import './assets/reset.css'


const app = createApp(App)

app.config.devtools = true;
app.config.productionTip = false;

app.use(createPinia())
app.use(router)

app.mount('#app')
