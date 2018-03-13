import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () ->
  Vue.http.headers.common['X-CSRF-Token'] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')

  element = document.getElementById 'document-form'

  if element != null
    ourDocument = JSON.parse(element.dataset.document)

    app = new Vue(
      el: element

      data: ->
        { document: ourDocument }

      methods: Submit: ->
        if ourDocument.id == null
          @$http # New action
            .post '/documents', document: @document
            .then (response) ->
                Turbolinks.visit "/documents/#{response.body.id}"
                return
              (response) ->
                @errors = response.data.errors
                return
        else
          @$http # Edit action
            .put "/documents/#{document.id}", document: @document
            .then (response) ->
                Turbolinks.visit "/documents/#{response.body.id}"
                return
              (response) ->
                @errors = response.data.errors
                return
        return
  )
)
