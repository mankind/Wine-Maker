WineMaker.Views.Wineries ||= {}

class WineMaker.Views.Wineries.EditView extends Backbone.View
  template : JST["backbone/templates/wineries/edit"]

  events :
    "submit #edit-winery" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (winery) =>
        @model = winery
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
