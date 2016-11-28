class CreateReservationTable < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.references :user, :index => true, :foreign_key => :user_id
    	t.references :listing, :index => true, :foreign_key => :listing_id
    	t.datetime :check_in_date, :null => false
    	t.datetime :check_out_date, :null => false
    	t.string :total_price

    	t.timestamps
    end
  end
end
