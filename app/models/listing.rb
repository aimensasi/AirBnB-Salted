class Listing < ActiveRecord::Base

	belongs_to :users
	has_many :avatars, :class_name => :ListingImage, :dependent => :destroy

	accepts_nested_attributes_for :avatars

	validates_presence_of :room_type, :property_type, :country, :state, :zip_code
	
	scope :top, -> {order('price_per_night DESC').limit(5) }
end

