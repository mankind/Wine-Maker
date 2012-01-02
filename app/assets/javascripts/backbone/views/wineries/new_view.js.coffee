WineMaker.Views.Wineries ||= {}

class WineMaker.Views.Wineries.NewView extends Backbone.View
  template: JST["backbone/templates/wineries/new"]

  events:
    "submit #new-winery": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (winery) =>
        @model = winery
        window.location.hash = "/#{@model.id}"

      error: (winery, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
