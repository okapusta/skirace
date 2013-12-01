class Skirace.Views.IndexView extends Backbone.View

  el: $ '.application-container'

  template: JST['index']

  events:
    "click #new-race" : "newRace"
    "click #new-contestant" : "newContestant"
    "click #data-export" : "dataExport"

  initialize: (args) ->
    _.bindAll(this, 'render')
    IndexView.prototype.render()
    args.contestants.fetch({
      success: (data) ->
        new Skirace.Views.Contestants.Index({contestants: data.models})
    })
    
    args.contests.fetch({
      success: (data) ->
        new Skirace.Views.Contests.Index({contests: data.models})
    })

  render: -> 
    $(@el).html @template

  newContestant: ->
    unless $('#new-contestant-form').is(":visible")
      unless $('#new-contestant-form').length
        new Skirace.Views.Contestants.New({el: $('.form-wrapper')})
      else
        $('#new-contestant-form').show()
    else
      $('#new-contestant-form').hide()

  newRace: ->
    unless $('#new-contest-form').is(":visible")
      unless $('#new-contest-form').length
        new Skirace.Views.Contests.New({el: $('.form-wrapper')})
      else
        $('#new-contest-form').show()
    else
      $('#new-contest-form').hide()

  dataExport: ->
    new Skirace.Views.Export.Modal()
