class WineriesController < ApplicationController
  respond_to :html, :json  
  def index
   @wineries = Winery.try(:all)
    respond_with @wineries
  end

  def show
   @winery = Winery.find_by_id(params[:id])
   respond_with @winery
  end

  def new
   @winery = Winery.new
  end

  def edit
   @winery = Winery.find_by_id(params[:id])
  end

  def create
   @winery = Winery.new(params[:winery])
     if @winery.save
     redirect_to wineries_path
     else
     render new
     end
  end

  def update
    @winery = Winery.find_by_id(params[:id])
      if @winery.update_attributes(params[:winery])
      redirect_to wineries_path
      else
      render Edit
      end
  end

  def destroy
    @winery = Winery.find_by_id(params[:id])
    Winery.destroy
    redirect_to wineries_path, :notice => "#{winery.title}, was deleted"
  end

end
