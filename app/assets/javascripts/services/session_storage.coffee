class Skirace.Services.SessionStorage

  get: (key) ->
    sessionStorage[key]
  
  set: (key, value) ->
    sessionStorage[key] = value
