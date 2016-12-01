class Reservation < ActiveRecord::Base

	belongs_to :tenant, :class_name => "User", :foreign_key => :user_id
	belongs_to :listing

	validates_presence_of :user_id, :listing_id, :check_in_date, :check_out_date


	def validate_dates

		reserved_listings = Reservation.where('listing_id = ?', listing.id)
			#listing has been reserved before 
		if !reserved_listings.empty?
			reserved_listings.each do |reserved|
				#listing exists but not save at the given date
				if check_in_date.between?(reserved.check_in_date, reserved.check_out_date) || 
					 check_in_date.between?(reserved.check_in_date, reserved.check_out_date)
					 return false
				end
			end
		else	
			true
		end	
	end

	def check_in
		check_in_date.strftime("On %B %e, %Y")
	end

	def check_out
		check_out_date.strftime("On %B %e, %Y")
	end
end

