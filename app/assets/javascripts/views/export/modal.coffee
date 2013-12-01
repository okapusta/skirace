class Skirace.Views.Export.Modal extends Backbone.View

  template: JST['export/modal']

  el: $ '.application-container'

  events:
    'click #export' : 'export'

  initialize: ->
    @render()

  render: ->
    $(@el).append @template

  export: ->
    $('#export-form').submit()