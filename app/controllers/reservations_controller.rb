class ReservationsController < ApplicationController
  

	def index
  end

  def show
  end

  def create
  	@res = Reservation.create_from_hash(reservation_params)
  	if @res.errors.empty?
      ReservationMailer.confirm_reservation(@res).deliver_later
  		redirect_to user_path current_user	
  	else
  		puts "ERRORRS #{@res.errors.full_messages.first}"
      redirect_to listing_path @res.listing
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
