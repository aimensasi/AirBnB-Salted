class SearchEnigneController < ApplicationController
  layout 'alt_layout'
  
  def new

  end

  def create
  	puts "params #{params['_json']}"
  	Listing.filter(params['_json'])
  end
end
