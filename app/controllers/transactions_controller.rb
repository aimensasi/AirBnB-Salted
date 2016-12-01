class TransactionsController < ApplicationController

	layout 'alt_layout'

  def new
  	@reservation = Reservation.find_by_id(params[:reservation_id])
  	if !@reservation.nil?
  		@client_token =  Braintree::ClientToken.generate
  	else
  		redirect_to root_url
  	end
  end

  def create
  	@reservation = Reservation.find_by_id(params[:reservation_id])
  	nonce_from_the_client = params[:payment_method_nonce]
  	result = Braintree::Transaction.sale(
  	  :amount => @reservation.total_price,
  	  :payment_method_nonce => 'fake-valid-nonce',
  	  :options => {
  	    :submit_for_settlement => true
  	  }
  	)
  	if result.success?
  		ReservationMailer.confirm_reservation(@reservation).deliver_later
  		redirect_to user_path current_user, :notice => "Congraulations! Your transaction has been successfully!"
  	else
  		puts "Error >> #{result.errors.inspect}"
  		flash[:error] = "Something went wrong while processing your transaction. Please try again!"
  		@client_token =  Braintree::ClientToken.generate
  		render :new	
  	end

  end

end
