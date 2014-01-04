class Skirace.Views.Contests.Public extends Backbone.View

  template: JST['contests/public']
  el: '#contestant-list'
  
  initialize: (data) ->
    @contest = data.models[0]
    @render()

  render: ->
    $(@el).html @template({contest: @contest})
