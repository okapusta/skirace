class Skirace.Views.Contests.New extends Backbone.View

  template: JST['contests/new']
    
  initialize: (args) ->
    @contestant = new Skirace.Models.Contestant()
    New.prototype.render(args.el)

  render: (el) ->
    $(el).html @template