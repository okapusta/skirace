class Skirace.Views.IndexView extends Backbone.View

  el: $ '.application-container'

  template: JST['contestants/index']

  initialize: (contestants) ->
    _.bindAll(this, 'render')
    contestants.collection.fetch({
      success: (data) ->
        console.log(data)
        IndexView.prototype.render(data) 
    })

  render: (data) -> 
    $(@el).html @template({contestants: data.models})