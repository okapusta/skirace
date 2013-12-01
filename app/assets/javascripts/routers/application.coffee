class Skirace.Routers.Application extends Backbone.Router

  initialize: -> 
    @contests = new Skirace.Collections.Contests()
    @contestants = new Skirace.Collections.Contestants()

    
  routes:
    "" : "index"
    "index" : "index"

  index: ->
    new Skirace.Views.IndexView({contests: @contests, contestants: @contestants})