class WineMaker.Routers.WineriesRouter extends Backbone.Router
  initialize: (options) ->
    @wineries = new WineMaker.Collections.WineriesCollection()
    @wineries.reset options.wineries

  routes:
    "/new"      : "newWinery"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newWinery: ->
    @view = new WineMaker.Views.Wineries.NewView(collection: @wineries)
    $("#wineries").html(@view.render().el)

  index: ->
    @view = new WineMaker.Views.Wineries.IndexView(wineries: @wineries)
    $("#wineries").html(@view.render().el)

  show: (id) ->
    winery = @wineries.get(id)

    @view = new WineMaker.Views.Wineries.ShowView(model: winery)
    $("#wineries").html(@view.render().el)

  edit: (id) ->
    winery = @wineries.get(id)

    @view = new WineMaker.Views.Wineries.EditView(model: winery)
    $("#wineries").html(@view.render().el)
