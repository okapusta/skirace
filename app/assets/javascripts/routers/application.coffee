class Skirace.Routers.Application extends Backbone.Router

  initialize: -> 
    @contests = new Skirace.Collections.Contests()
    @contestants = new Skirace.Collections.Contestants()

    
  routes:
    "" : "index"
    "index" : "index"
    "login" : "login"
    "signout" : "signout"

  index: ->
    new Skirace.Views.IndexView({contests: @contests, contestants: @contestants})

  login: ->
    new Skirace.Views.Users.Login()

  signout: ->
    for storage in [new Skirace.Services.ClientStorage(), new Skirace.Services.SessionStorage]
      storage.purge()
    
    $.ajax '/logout',
      type: 'DELETE',
      success: (data) ->
        window.location.href = data.return_to
