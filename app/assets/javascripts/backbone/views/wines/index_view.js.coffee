WineMaker.Views.Wines ||= {}

class WineMaker.Views.Wines.IndexView extends Backbone.View
  template: JST["backbone/templates/wines/index"]

  initialize: () ->
    @options.wines.bind('reset', @addAll)

  addAll: () =>
    @options.wines.each(@addOne)

  addOne: (wine) =>
    view = new WineMaker.Views.Wines.WineView({model : wine})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(wines: @options.wines.toJSON() ))
    @addAll()

    return this
