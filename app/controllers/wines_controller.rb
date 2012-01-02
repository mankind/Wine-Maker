class WinesController < ApplicationController

  before_filter do
    @winery = Winery.find_by_id(params[:winery_id])
  end

  def create
    @winery.wines.create(params[:wine])
    redirect_to @winery
  end

  def destroy
    wine = Wine.find_by_id(params[:id])
    wine.destroy
    redirect_to @post
  end
end
