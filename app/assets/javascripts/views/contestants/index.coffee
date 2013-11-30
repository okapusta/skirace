##= require ./../index

class Skirace.Views.Contestants.Index extends Skirace.Views.IndexView

  template: JST['contestants/index']

  initialize: ->
    super new Skirace.Views.IndexView(collection: @contestants)