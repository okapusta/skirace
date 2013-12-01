class Skirace.Models.Contestant extends Backbone.Model
  
  urlRoot: '/contestants'
  paramRoot: 'contestant'

  validate: (attrs, options) ->
    if (attrs.first_name == '')
      Window alert 'Zawodnik musi miec imie'
    if (attrs.last_name == '')
      Window alert 'Zawodnik musi miec nazwisko'