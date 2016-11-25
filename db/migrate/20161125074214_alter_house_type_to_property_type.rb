class AlterHouseTypeToPropertyType < ActiveRecord::Migration
  def change
  	rename_column :listings, :house_type, :property_type
  end
end
