class Skirace.Models.Contestant extends Backbone.Model
  
  urlRoot: '/contestants'

  validate: (attrs, options) ->
    if (attrs.first_name == '')
      Window alert 'Zawodnik musi miec imie'
    if (attrs.last_name == '')
      Window alert 'Zawodnik musi miec nazwisko'

  save: (attrs, options) ->
    data = new Skirace.Services.AttributeBuilder('contestant', attrs, {join: 'contest'})
    $.ajax @urlRoot,
      type: 'POST',
      dataType: 'json',
      data: data.as_json()



      

