class Skirace.Views.Export.Modal extends Backbone.View

  template: JST['export/modal']

  el: $ '.application-container'

  events:
    'click #export' : 'export'
    'click .modal-close' : 'close'

  initialize: ->
    @render()

  render: ->
    $(@el).append @template

  export: ->
    $('#export-form').submit()

  close: ->
    $('.export-modal').remove()