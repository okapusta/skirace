class Skirace.Views.Settings.Modal extends Backbone.View
  
  template: JST['settings/modal']

  el: $ '.application-container'

  events:
    'click .modal-close' : 'settingsClose'

  initialize: ->
    @render()

  render: ->
    $(@el).append @template

  settingsClose: ->
    $('.settings-modal').remove()