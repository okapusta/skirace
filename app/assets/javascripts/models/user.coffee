class Skirace.Models.User extends Backbone.Model

  urlRoot: '/login'

  login: (username, password) ->
    client_storage = new Skirace.Services.ClientStorage() 
    @data =
      username: username 
      password: password

    $.ajax @urlRoot,
      type: 'POST',
      dataType: 'json'
      data: JSON.stringify(@data)
      success: (data) ->
        client_storage.set('current_user', JSON.stringify(data.user))
  