class CreateListingsTable < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.references :user, :index => true, :foreign_key => :user_id
    	t.string :room_type, :null => false
    	t.string :house_type, :null => false
    	t.string :price_per_night
    	t.integer :beds_number
    	t.integer :bathrooms_number
    	t.integer :guest_no
    	t.time :check_in_time
    	t.time :check_out_time
    	t.string :country
    	t.string :state
    	t.string :zip_code
    	t.string :address
    	t.boolean :is_available

    	t.timestamps
    end
  end
end
