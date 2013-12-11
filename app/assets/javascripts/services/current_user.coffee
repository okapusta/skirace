class Skirace.Services.CurrentUser

  constructor: ->
    @client_storage = new Skirace.Services.ClientStorage()

  authenticated: ->
    return unless @get()
    
    user = JSON.parse(@get())
    if user.authenticated
      return {authenticated: true, auth_token: user.auth_token}
    else
      return false
    end

  get: ->
    @client_storage.get('current_user')