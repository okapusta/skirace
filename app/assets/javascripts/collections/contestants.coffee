class Skirace.Collections.Contestants extends Backbone.Collection

  model: Skirace.Models.Contestant
  url: '/contests/:id/contestants'

  fetch: ->
    
    collection = this

    @current_contest = new Skirace.Services.CurrentContest()

    $.ajax({
      type: 'GET',
      url: @url.replace(':id', @current_contest.id()),
      dataType: 'json',
      async: false,
      success: (data) ->
        collection.reset(data)
    })
    collection.models