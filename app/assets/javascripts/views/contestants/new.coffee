class Skirace.Views.Contestants.New extends Backbone.View

  template: JST['contestants/new']
  
  el: $ '#new-contestant-form'

  events:
    "submit form" : "create"
  
  initialize: (args) ->
    @contestant = new Skirace.Models.Contestant()
    New.prototype.render(args.el)

  render: (el) ->
    $(el).html @template
    debugger
    $(el).append JST['shared/close']()

  create: (event) ->
    event.preventDefault()
    params =
      contestant = 
        first_name: $('input[name=first_name]').val()
        last_name: $('input[name=last_name]').val()
    @contestant.save(params)
    window.location.reload()