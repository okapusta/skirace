class Skirace.Services.CurrentContest
  contest: 'a.dropdown-toggle#contest-dropdown :first-child'

  constructor: ->
    @current_contest = $(@contest)

  name: ->
    @current_contest.text()

  id: ->
    @current_contest.attr('value')