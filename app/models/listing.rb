class Listing < ActiveRecord::Base

	belongs_to :owner, :class_name => :User, :foreign_key => :user_id
	has_many :avatars, :class_name => :ListingImage, :dependent => :destroy

	accepts_nested_attributes_for :avatars

	validates_presence_of :user_id, :room_type, :property_type, :country, :state, :zip_code
	
	scope :top, -> { joins(:avatars).order('price_per_night DESC').limit(5) }

	def check_in
		check_in_time.strftime("%I:%M %p")
	end

	def check_out
		check_out_time.strftime("%I:%M %p")
	end
end

