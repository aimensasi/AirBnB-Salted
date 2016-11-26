class RenameImgUrlToAvatar < ActiveRecord::Migration
  def change
  	rename_column :listing_images, :img_url, :avatar
  end
end
