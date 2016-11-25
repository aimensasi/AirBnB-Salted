class Listing < ActiveRecord::Base

	belongs_to :users

	validates_presence_of :room_type, :property_type, :country, :state, :zip_code

	scope :top, -> {order('price_per_night DESC').limit(5) }
end
