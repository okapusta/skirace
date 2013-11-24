class Skirace.Models.Contestant extends Backbone.Model
  
  urlRoot: '/contestants'
  paramRoot: 'contestant'

  validate: (attrs, options) ->
    if ((attrs.first_name == '') || (attrs.last_name == ''))
      return 'Zawodnik musi miec imie'