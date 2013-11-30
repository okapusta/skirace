class Skirace.Views.Contestants.New extends Backbone.View

  template: JST['contestants/new']
  
  initialize: (args) ->
    @contestant = new Skirace.Models.Contestant()
    New.prototype.render(args.el)

  render: (el) ->
    $(el).html @template