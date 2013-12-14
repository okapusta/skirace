class Skirace.Models.User extends Backbone.Model

  urlRoot: '/login'

  login: (username, password) ->
    session_storage = new Skirace.Services.SessionStorage() 
    @data =
      username: username 
      password: password

    $.ajax @urlRoot,
      type: 'POST',
      dataType: 'json'
      data: JSON.stringify(@data)
      success: (data) ->
        session_storage.set('current_user', JSON.stringify(data.user))
        window.location.reload()
  