class AddSummaryAndTitleToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :title, :string
  	add_column :listings, :summary, :text
  end
end
