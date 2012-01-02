class WineMaker.Models.Wine extends Backbone.Model
  paramRoot: 'wine'

  defaults:
    name: null
    year: null
    family: null
    winery_id: null
    created_at: null
    updated_at: null

class WineMaker.Collections.WinesCollection extends Backbone.Collection
  model: WineMaker.Models.Wine
  url: '/wines'
