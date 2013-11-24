window.Skirace =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

window.Skirace.init = ->
  app = new Skirace.Routers.ApplicationRouter()
  Backbone.history.start()
  console.log 'Application initialized'