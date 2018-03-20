import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
import FormDocument from '../form-document.vue.erb'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

Vue.component('form-document', FormDocument)

document.addEventListener('turbolinks:load', () ->
  Vue.http.headers.common['X-CSRF-Token'] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')

  element = document.getElementById 'vue-app'

  if element?
    app = new Vue(
      el: element
    )
)
