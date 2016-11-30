class ListingImage < ActiveRecord::Base

	
	mount_uploader :avatar, AvatarUploader
	process_in_background :avatar
	belongs_to :listing

	validates_presence_of :avatar, :listing_id

	def avatar_changed?
		true
	end
end

