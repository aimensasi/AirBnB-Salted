class ListingsController < ApplicationController
  
  def index
    @listings = Listing.paginate(:page => params[:page])
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end