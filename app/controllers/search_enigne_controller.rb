class SearchEnigneController < ApplicationController
  layout 'alt_layout'
  
  def new
  end

  def create
    
  	@listings = Listing.filters(search_filters)
    @search_filters = search_filters
    if request.xhr?
      {:statue => 200, :template => render(:partial => 'listings/partials/listing', :layout => false)}.to_json
    else
      render :new
    end
  end


  private 

  def search_filters
  	params
  end
end

# scope :by_guests, -> (guests_no) {  		
# 		return all unless guests_no.present?
# 		where(:guest_no => guests_no)
# 	}

# 	scope :by_room, -> (room_type) {  		
# 		return all unless room_type.present?
# 		where(:room_type => room_type)
# 	}

# 	scope :by_beds_number, -> (beds_number) {  		
# 		return all unless beds_number.present?
# 		where(:beds_number => beds_number)
# 	}

# 	scope :by_bathrooms_number, -> (bathrooms_number) {  		
# 		return all unless bathrooms_number.present?
# 		where(:bathrooms_number => bathrooms_number)
# 	}

# 	scope :by_wifi, -> (wifi) {  		
# 		return all unless wifi.present?
# 		where(:wifi => wifi)
# 	}

# 	scope :by_kitchen, -> (kitchen) {  		
# 		return all unless kitchen.present?
# 		where(:kitchen => kitchen)
# 	}

# 	scope :by_pool, -> (pool) {  		
# 		return all unless pool.present?
# 		where(:pool => pool)
# 	}

# 	scope :by_tv, -> (tv) {  		
# 		return all unless tv.present?
# 		where(:tv => tv)
# 	}

# 	scope :by_air_con, -> (air_con) {  		
# 		return all unless air_con.present?
# 		where(:air_con => air_con)
# 	}

# 	scope :by_smoking, -> (smoker) {  		
# 		return all unless smoker.present?
# 		where(:smoker => smoker)
# 	}
