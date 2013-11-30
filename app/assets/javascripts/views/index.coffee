class Skirace.Views.IndexView extends Backbone.View

  el: $ '.application-container'

  template: JST['index']

  events:
    "click #new-race" : "newRace"
    "click #new-contestant" : "newContestant"

  initialize: (contestants) ->
    _.bindAll(this, 'render')
    contestants.collection.fetch({
      success: (data) ->
        IndexView.prototype.render(data) 
    })

  render: (data) -> 
    $(@el).html @template({contestants: data.models})

  newContestant: ->
    unless $('#new-contestant-form').is(":visible")
      unless $('#new-contestant-form').length
        new Skirace.Views.Contestants.New({el: $('.form-wrapper')})
      else
        $('#new-contestant-form').show()
    else
      $('#new-contestant-form').hide()

  newRace: ->
    console.log 'dupa'
    unless $('#new-contest-form').is(":visible")
      console.log 'dupa1'
      unless $('#new-contest-form').length
        console.log 'dupa2'
        new Skirace.Views.Contests.New({el: $('.form-wrapper')})
      else
        $('#new-contest-form').show()
    else
      $('#new-contest-form').hide()
