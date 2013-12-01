class Skirace.Views.Contests.Index extends Backbone.View
  
  template: JST['contests/index']

  el: 'ul.nav'

  initialize: (args) ->
    @contests = args.contests  
    @render()
  render: ->
    $(@el).prepend @template({contests: @contests})