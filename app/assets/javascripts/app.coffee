window.Skirace =
  Models: {}
  Collections: {}
  Routers: {}
  Views:
    Contests: {}
    Contestants: {}
    Users: {}
    Export: {}
    Settings: {}
  Services:
    Contestant: {}
  init: ->
    if typeof(Storage) == "undefined"
      alert "Twoja przegladarka nie obsluguje Web Storage\n\n" +
      "Obsługiwane przeglądarki: IE 8+, Firefox, Opera, Chrome, Safari."
      return
    app = new Skirace.Routers.Application()
    Backbone.history.start()
  