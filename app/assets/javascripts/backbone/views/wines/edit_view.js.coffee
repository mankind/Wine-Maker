WineMaker.Views.Wines ||= {}

class WineMaker.Views.Wines.EditView extends Backbone.View
  template : JST["backbone/templates/wines/edit"]

  events :
    "submit #edit-wine" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (wine) =>
        @model = wine
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
