WineMaker.Views.Wines ||= {}

class WineMaker.Views.Wines.NewView extends Backbone.View
  template: JST["backbone/templates/wines/new"]

  events:
    "submit #new-wine": "save"

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
      success: (wine) =>
        @model = wine
        window.location.hash = "/#{@model.id}"

      error: (wine, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
