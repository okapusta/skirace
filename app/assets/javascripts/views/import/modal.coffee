class Skirace.Views.Import.Modal extends Backbone.View

  template: JST['import/modal']
  
  importForm: '#import-form' 
  el: $ '.application-container'

  events:
   'click #import' : 'import'

  initialize: ->
    @render()

  render: ->
    $(@el).append @template

  import: ->
    $(@importForm).submit()