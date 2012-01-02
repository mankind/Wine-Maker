WineMaker.Views.Wineries ||= {}

class WineMaker.Views.Wineries.WineryView extends Backbone.View
  template: JST["backbone/templates/wineries/winery"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
