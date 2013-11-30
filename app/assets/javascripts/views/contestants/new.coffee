class Skirace.Views.Contestants.New extends Backbone.View

  el: $ '#new-contestant-form'
  container: $ '.new-contestant' 

  template: JST['contestants/new']
  
  initialize: ->
    @contestant = new Skirace.Models.Contestant()
    @render

  render: ->
    $(@container).html @template