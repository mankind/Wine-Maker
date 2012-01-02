WineMaker.Views.Wineries ||= {}

class WineMaker.Views.Wineries.ShowView extends Backbone.View
  template: JST["backbone/templates/wineries/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
