class Skirace.Services.ClientStorage
  
  get: (key) ->
    localStorage[key]

  set: (key, value) ->
    localStorage[key] = value

  purge: ->
    for storage in localStorage
      localStorage.removeItem(localStorage.key(storage))

  

