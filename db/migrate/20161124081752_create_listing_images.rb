class CreateListingImages < ActiveRecord::Migration
  def change
    create_table :listing_images do |t|
    	t.references :listing, :index => true, :foreign_key => :listing_id
    	t.string :img_url, :null => false

    	t.timestamps
    end
  end
end
