class Skirace.Models.User extends Backbone.Model

  urlRoot: '/login'

  initialize: ->
    @client_storage = new Skirace.Services.ClientStorage()  

  login: (username, password) ->
    @data =
      username: username 
      password: password

    $.ajax @urlRoot,
      type: 'POST',
      dataType: 'json'
      data: JSON.stringify(@data)
      success: (data) ->
        @client_storage.set('current_user', data)
  