class Listing < ActiveRecord::Base

	belongs_to :users

	scope :top, -> { order('price_per_night DESC').limit(7)}
end

