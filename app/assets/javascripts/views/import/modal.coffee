class Skirace.Views.Import.Modal extends Backbone.View

  template: JST['import/modal']
  
  importForm: '#import-form' 
  el: $ '.application-container'

  events:
   'click #import' : 'import'
   'click .modal-close' : 'close'

  initialize: ->
    @render()

  render: ->
    $(@el).append @template

  import: ->
    $(@importForm).submit ->
      window.location.reload()

  close: ->
    $('.import-modal').remove()