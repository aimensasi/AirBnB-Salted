class SearchEnigneController < ApplicationController
  layout 'alt_layout'
  
  def new

  end

  def create
  	puts "params #{search_filters}"

  	listings = Listing.by_dates(search_filters[:check_in_date], search_filters[:check_out_date])
  end


  private 

  def search_filters
  	params
  end
end
