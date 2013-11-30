window.Skirace =
  Models: {}
  Collections: {}
  Routers: {}
  Views:
    Contests: {}
    Contestants: {}
  init: ->
    app = new Skirace.Routers.Application()
    Backbone.history.start()


   
