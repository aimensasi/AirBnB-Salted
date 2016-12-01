class ReservationsController < ApplicationController
  

	def index
  end

  def show
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.validate_dates
      price_per_night = @reservation.listing.price_per_night
      puts "private #{price_per_night}"
      puts "private #{@reservation.check_out_date}"
      puts "private #{@reservation.check_in_date}"
      puts "total_price #{price_per_night.to_i * (@reservation.check_out_date.to_date - @reservation.check_in_date.to_date).to_i}"
      @reservation.total_price = price_per_night.to_i * (@reservation.check_out_date.to_date - @reservation.check_in_date.to_date).to_i
      @reservation.save
      redirect_to :controller => 'transactions', :action => 'new', :reservation_id => @reservation.id 
    else
      flash[:error] = "The room is not avaliable at the given date"
      puts "ERRORRS #{@reservation.errors.full_messages}"
      redirect_to listing_path @reservation.listing
    end
  end

  def update
  end

  def destroy
    @reservation = Reservation.find_by_id(params[:id])
    @reservation.delete
    redirect_to user_path current_user
  end

  private

  def reservation_params
  	params.require(:reservations).permit(:check_in_date, :check_out_date, :guest_no)
  															 .merge(:user_id => current_user.id, :listing_id => params[:listing_id])
  end
end
