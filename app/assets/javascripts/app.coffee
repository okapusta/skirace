window.Skirace =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    app = new Skirace.Routers.Application()
    Backbone.history.start()