class ListingsController < ApplicationController
  
  layout :resolve_layout

  def index
    @listings = Listing.top
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

   def resolve_layout
     # puts "action_name #{action_name}"
     case action_name

     when "new", "show", "edit"
       "alt_layout"
     when "index"
       "application"
     end
   end  
end
