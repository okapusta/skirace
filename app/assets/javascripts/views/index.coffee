class Skirace.Views.IndexView extends Backbone.View

  el: $ '.application-container'

  template: JST['index']

  events:
    "click #new-race" : "newRace"
    "click #new-contestant" : "newContestant"
    "click #data-export" : "dataExport"
    "click .close-form" : "closeForm"

  initialize: (args) ->
    _.bindAll(this, 'render')

    @current_user = new Skirace.Services.CurrentUser()
    @render()

    args.contests.fetch({
      success: (data) ->
        if @current_user 
          new Skirace.Views.Contests.Index({contests: data.models})
          new Skirace.Views.Contestants.Index({contestants: args.contestants.fetch()})
      })

  render: -> 
    $(@el).html @template({current_user: @current_user})

  newContestant: ->
    unless $('#new-contestant-form').is(":visible")
      unless $('#new-contestant-form').length
        new Skirace.Views.Contestants.New({el: $('.form-wrapper')})
      else
        $('#new-contestant-form').show()
        $('.close-form').show()
    else
      $('#new-contestant-form').hide()
      $('.close-form').hide()

  newRace: ->
    unless $('#new-contest-form').is(":visible")
      unless $('#new-contest-form').length
        new Skirace.Views.Contests.New({el: $('.form-wrapper')})
      else
        $('#new-contest-form').show()
        $('.close-form').show()
    else
      $('#new-contest-form').hide()
      $('.close-form').hide()

  dataExport: ->
    new Skirace.Views.Export.Modal()

  closeForm: ->
    $('#new-contest-form').hide()
    $('#new-contestant-form').hide()
    $('.close-form').hide()