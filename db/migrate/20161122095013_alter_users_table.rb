class AlterUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :last_name, :string
  	add_column :users, :birthday, :string
  	add_column :users, :gender, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :state, :string
  	add_column :users, :country, :string
  	add_column :users, :zip_code, :string
  end
end
