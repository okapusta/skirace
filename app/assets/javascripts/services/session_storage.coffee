class Skirace.Services.SessionStorage

  get: (key) ->
    sessionStorage[key]
  
  set: (key, value) ->
    sessionStorage[key] = value

  purge: ->
    for storage in sessionStorage
      sessionStorage.removeItem(sessionStorage.key(storage))
