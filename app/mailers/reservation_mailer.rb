class ReservationMailer < ApplicationMailer

	def confirm_reservation(res)
	   @res = res
	   @url = "https://localhost:3000/listings/#{@res.listing.id}"
	   mail(to: @res.tenant.email, subject: 'Reservation Confirmation')
	 end
	
end
