import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
import FormDocument from '../form-document.vue.erb'
import ShowDocument from '../show-document.vue'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

Vue.component('form-document', FormDocument)
Vue.component('show-document', ShowDocument)

document.addEventListener('turbolinks:load', ->
  element = document.getElementById 'vue-app'

  if element?
    app = new Vue(
      el: element
      data:
        csrfToken: document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    )
)

Turbolinks.dispatch("turbolinks:load")
