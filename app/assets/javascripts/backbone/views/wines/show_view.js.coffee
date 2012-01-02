WineMaker.Views.Wines ||= {}

class WineMaker.Views.Wines.ShowView extends Backbone.View
  template: JST["backbone/templates/wines/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
