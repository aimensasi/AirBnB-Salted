class Reservation < ActiveRecord::Base

	belongs_to :tenant, :class_name => "User", :foreign_key => :user_id
	belongs_to :listing

	validates_presence_of :user_id, :listing_id, :check_in_date, :check_out_date



	def self.create_from_hash(params)

		reserved_listings = self.where('listing_id = ?', params[:listing_id])
		if reserved_listings.empty?
			reservation = self.create(params)
			reservation
		else
			reserved_listings.each do |reservation|
				if params[:check_in_date].between?(reservation.check_in_date, reservation.check_out_date) || params[:check_out_date].between?(reservation.check_in_date, reservation.check_out_date)
						reservation.errors.add(:listing_id, "is reserved during the given date")
						return reservation
				end
			end
			reservation = self.create(params)
			reservation
		end
	end

	def check_in
		check_in_date.strftime("On %B %e, %Y")
	end

	def check_out
		check_out_date.strftime("On %B %e, %Y")
	end
end

