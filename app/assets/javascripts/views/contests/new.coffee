class Skirace.Views.Contests.New extends Backbone.View

  template: JST['contests/new']

  el: $ '#new-contest-form'

  events:
    'submit form' : 'create'

  initialize: (args) ->
    @contest = new Skirace.Models.Contest()
    New.prototype.render(args.el)

  render: (el) ->
    $(el).html @template

  create: (event) ->
    event.preventDefault()
    params =
      contest = 
        name: $('input[name=name]').val()
    @contest.save(params)
    window.location.reload()