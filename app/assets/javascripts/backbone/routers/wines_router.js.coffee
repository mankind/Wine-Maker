class WineMaker.Routers.WinesRouter extends Backbone.Router
  initialize: (options) ->
    @wines = new WineMaker.Collections.WinesCollection()
    @wines.reset options.wines

  routes:
    "/new"      : "newWine"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newWine: ->
    @view = new WineMaker.Views.Wines.NewView(collection: @wines)
    $("#wines").html(@view.render().el)

  index: ->
    @view = new WineMaker.Views.Wines.IndexView(wines: @wines)
    $("#wines").html(@view.render().el)

  show: (id) ->
    wine = @wines.get(id)

    @view = new WineMaker.Views.Wines.ShowView(model: wine)
    $("#wines").html(@view.render().el)

  edit: (id) ->
    wine = @wines.get(id)

    @view = new WineMaker.Views.Wines.EditView(model: wine)
    $("#wines").html(@view.render().el)
