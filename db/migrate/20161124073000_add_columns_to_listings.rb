class AddColumnsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :smoker, :integer, :default => 0
  	add_column :listings, :wifi, :integer, :default => 0
  	add_column :listings, :pool, :integer, :default => 0
  	add_column :listings, :tv, :integer, :default => 0
  	add_column :listings, :Kitchen, :integer, :default => 0
  	add_column :listings, :air_con, :integer, :default => 0
  end
end
