WineMaker.Views.Wineries ||= {}

class WineMaker.Views.Wineries.IndexView extends Backbone.View
  template: JST["backbone/templates/wineries/index"]

  initialize: () ->
    @options.wineries.bind('reset', @addAll)

  addAll: () =>
    @options.wineries.each(@addOne)

  addOne: (winery) =>
    view = new WineMaker.Views.Wineries.WineryView({model : winery})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(wineries: @options.wineries.toJSON() ))
    @addAll()

    return this
