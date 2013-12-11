class Skirace.Views.Export.Modal extends Backbone.View

  template: JST['export/modal']
  
  exportForm: '#export-form' 
  el: $ '.application-container'

  events:
    'click #export' : 'export'
    'click .modal-close' : 'exportClose'

  initialize: ->
    @current_contest = new Skirace.Services.CurrentContest()
    @render()

  render: ->
    $(@el).append @template

  export: ->
    $(@exportForm).prepend($("<input name='contest' type='hidden' value='#{@current_contest.id()}' />"))

    .submit()

  exportClose: ->
    $('.export-modal').remove()