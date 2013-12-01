class Skirace.Models.Contest extends Backbone.Model

  urlRoot: '/contests'
  paramRoot: 'contest'

  validate: (attrs, options) ->
    if (attrs.name == '')
      return 'Zawody musza miec nazwe!'