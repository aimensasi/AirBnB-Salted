class SearchEngineController < ApplicationController
  layout 'alt_layout'
  
  def new
  end

  def create

    puts "search_filters #{search_filters}"

  	@listings = Listing.filters(search_filters)
    if request.xhr?
      {:statue => 200, :template => render(:partial => 'listings/partials/listing', :layout => false)}.to_json
    else
      puts search_filters
      render :template => 'search_engine/new', :locals => {:params => search_filters}
    end
  end


  private 

  def search_filters
  	params
  end
end