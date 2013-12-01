class Skirace.Views.Contestants.Index extends Backbone.View
  
  template: JST['contestants/index']

  el: '#contestant-list'

  initialize: (args) ->
    @contestants = args.contestants  
    @render()
  render: ->
    $(@el).html @template({contestants: @contestants})
