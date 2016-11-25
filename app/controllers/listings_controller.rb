class ListingsController < ApplicationController
  skip_before_action :require_login, :only => [:index]
  
  layout :resolve_layout

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
    @listing = Listing.new(listings_params)

    if @listing.save
      flash.now.notice = "Listing Was added Successfully"
      redirect_to user_path(current_user)
    else
      flash.now.notice = "Ops! #{@listing.errors.full_messages.first}"
      render :action => :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def listings_params
    params.require(:listing)
    .permit(:room_type, :property_type, :price_per_night, :beds_number, :bathrooms_number,
            :guest_no, :check_in_time, :check_out_time, :country, :state, :zip_code,
            :address, :is_available, :smoker, :wifi, :pool, :tv, :Kitchen, :air_con)
  end

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

# t.string   "room_type",                  
# t.string   "property_type",              
# t.string   "price_per_night"
# t.integer  "beds_number"
# t.integer  "bathrooms_number"
# t.integer  "guest_no"
# t.time     "check_in_time"
# t.time     "check_out_time"
# t.string   "country"
# t.string   "state"
# t.string   "zip_code"
# t.string   "address"
# t.boolean  "is_available"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.integer  "smoker",
# t.integer  "wifi",             
# t.integer  "pool",             
# t.integer  "tv",               
# t.integer  "Kitchen",          
# t.integer  "air_con",          





