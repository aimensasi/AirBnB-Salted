class AddGuestNoToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :guest_no, :integer, :null => false
  end
end
