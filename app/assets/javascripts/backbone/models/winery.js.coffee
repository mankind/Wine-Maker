class WineMaker.Models.Winery extends Backbone.Model
  paramRoot: 'winery'

  defaults:
    name: null
    city: null
    state: null
    country: null
    created_at: null
    updated_at: null

class WineMaker.Collections.WineriesCollection extends Backbone.Collection
  model: WineMaker.Models.Winery
  url: '/wineries'
