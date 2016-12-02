class Listing < ActiveRecord::Base

	belongs_to :owner, :class_name => :User, :foreign_key => :user_id
	has_many :avatars, :class_name => :ListingImage, :dependent => :destroy
	has_many :reservations, :dependent => :destroy

	accepts_nested_attributes_for :avatars

	validates_presence_of :user_id, :room_type, :property_type, :country, :state, :zip_code
	
	scope :top, -> { joins(:avatars).order('price_per_night DESC').limit(5) }

	#filters scope
 	scope :by_dates, -> (check_in, check_out) { 
		return all unless check_in.present? && check_out.present?
		includes(:reservations).
		references(:reservations).
		where.not(:reservations => {:check_in_date => check_in..check_out,
																:check_out_date => check_in..check_out})
	}

	scope :by_guests, -> (guests_no) {  		
		return all unless guests_no.present?
		where(:guest_no => guests_no)
	}

	scope :by_room, -> (room_type) {  		
		return all unless room_type.present?
		where(:room_type => room_type)
	}

	scope :by_beds_number, -> (beds_number) {  		
		return all unless beds_number.present?
		where(:beds_number => beds_number)
	}

	scope :by_bathrooms_number, -> (bathrooms_number) {  		
		return all unless bathrooms_number.present?
		where(:bathrooms_number => bathrooms_number)
	}

	scope :by_wifi, -> (wifi) {  		
		return all unless wifi.present?
		where(:wifi => wifi)
	}

	scope :by_kitchen, -> (kitchen) {  		
		return all unless kitchen.present?
		where(:kitchen => kitchen)
	}

	scope :by_pool, -> (pool) {  		
		return all unless pool.present?
		where(:pool => pool)
	}

	scope :by_tv, -> (tv) {  		
		return all unless tv.present?
		where(:tv => tv)
	}

	scope :by_air_con, -> (air_con) {  		
		return all unless air_con.present?
		where(:air_con => air_con)
	}

	scope :by_smoking, -> (smoker) {  		
		return all unless smoker.present?
		where(:smoker => smoker)
	}



	def self.filter(filters)
		query = ""
		args = ""
		dates_query = ""
		filters.each do |filter|
			puts "FIlter #{filter}"
			query << " #{filter[:name]} = ?"
			args <<  "#{filter[:value]} "
			dates_query = "#{filter[:name]} Between ?" if condition
		end
		puts "Query #{query}"
		puts "Args #{args.split(' ')}"
		# where(query, args)
	end



	def check_in
		check_in_time.strftime("%I:%M %p")
	end

	def check_out
		check_out_time.strftime("%I:%M %p")
	end

	def last_update
		updated_at.strftime("On %B %e, %Y")
	end
end

