class Skirace.Views.Contests.Index extends Backbone.View
  
  template: JST['contests/index']

  el: 'ul.nav'
  contestDropdown: "a.dropdown-toggle#contest-dropdown"

  events:
    "click .dropdown-menu li a.contest" : "update"

  initialize: (args) ->
    @client_storage = new Skirace.Services.ClientStorage()
    @current_contest = @client_storage.get('current_contest')
    @option_selected = JSON.parse(@current_contest) unless @current_contest == undefined 
    @contests = args.contests
    @render()

  render: ->
    $(@el).prepend @template({contests: @contests})
    
    obj = if typeof(@option_selected) == "object"  
      JST['contests/option_selected']({contest: @option_selected}) 
    else 
      $('a.contest').first().clone()

    $(@contestDropdown).prepend obj

  update: (event) ->
    target = $(event.target)
    current_contest =
      name: target.text()
      id: target.attr('value')

    if @model.set_current_contest
      @client_storage.set('current_contest', JSON.stringify(current_contest))
    
    window.location.reload()