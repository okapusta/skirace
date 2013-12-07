class Skirace.Services.AttributeBuilder

  contest: 'a.dropdown-toggle#contest-dropdown :first-child'

  constructor: (model, attrs, options) ->
    @obj = {}
    @model = model
    @attrs = attrs
    @options = options

    @build()

  build: ->
    @obj[@model] = @attrs

    if typeof(@options) == 'object' && @options.join != undefined
      @el = this[@options.join]
      @obj[@options.join] = { id: $(@el).attr('value'), name: $(@el).text() }

  as_json: ->
    JSON.stringify(@obj)

