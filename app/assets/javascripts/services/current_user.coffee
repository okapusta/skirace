class Skirace.Services.CurrentUser

  constructor: ->
    @session_storage = new Skirace.Services.SessionStorage()

  authenticated: ->
    return unless @get()
    
    user = JSON.parse(@get())
    if user.authenticated
      return {authenticated: true, auth_token: user.auth_token}
    else
      return false
    end

  get: ->
    @session_storage.get('current_user')