window.Skirace =
  Models: {}
  Collections: {}
  Routers: {}
  Views:
    Contestants: {}
  init: ->
    app = new Skirace.Routers.Application()
    Backbone.history.start()