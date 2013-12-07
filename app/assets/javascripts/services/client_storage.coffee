class Skirace.Services.ClientStorage
  
  get: (key) ->
    localStorage[key]

  set: (key, value) ->
    localStorage[key] = value

