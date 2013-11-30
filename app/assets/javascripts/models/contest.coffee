class Skirace.Models.Contest extends Backbone.Model

  urlRoot: '/contest'
  paramRoot: 'contest'

  validate: (attrs, options) ->
    if (attrs.name == '')
      return 'Zawody musza miec nazwe!'