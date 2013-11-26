class Skirace.Routers.Application extends Backbone.Router

  initialize: -> 
    @contestants = new Skirace.Collections.Contestants()


  routes:
    "": "index"
    "index": "index"

  index: ->
    view = new Skirace.Views.IndexView(collection: @contestants)
    view.render()