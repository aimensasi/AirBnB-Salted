class ListingsController < ApplicationController
  skip_before_action :require_login, :only => [:index]
  
  def index
    @listings = Listing.top
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    render 'new', :layout => 'alt_layout'
  end

  def create
    puts "Listings #{params.inspect}"
    return
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
