class ListingImage < ActiveRecord::Base

	
	mount_uploader :avatar, AvatarUploader
	belongs_to :listing

	validates_presence_of :avatar, :listing_id
end

