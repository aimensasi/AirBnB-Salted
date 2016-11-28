		# # 100.times do 
		# # 	User.create(
		# # 		:first_name => Faker::Name.first_name,
		# # 		:last_name => Faker::Name.last_name,
		# # 		:email => Faker::Internet.email,
		# # 		:birthday => Faker::Date.between(28.year.ago, Date.today),
		# # 		:gender => ['male', 'female'].sample,
		# # 		:phone_number => Faker::PhoneNumber.cell_phone,
		# # 		:state => Faker::Address.state,
		# # 		:country => Faker::Address.country,
		# # 		:zip_code => Faker::Address.zip_code,
		# # 		:password => Faker::Internet.password(8, 70, true)
		# # 		)
		# # end

		# user_ids = User.ids

		# 100.times do 
		# 	Listing.create(
		# 		:user_id => user_ids.sample,
		# 		:room_type => ['private', 'shared', 'entire'].sample,
		# 		:house_type => ['house', 'apartment'].sample,
		# 		:beds_number => rand(1..5),
		# 		:bathrooms_number => rand(1..4),
		# 		:guest_no => rand(1..6),
		# 		:price_per_night => rand(60.0..700.0).round(2),
		# 		:check_in_time => "#{rand(2..4)} #{['AM', 'PM'].sample}",
		# 		:check_out_time => "#{rand(10..12)} #{['AM', 'PM'].sample}",
		# 		:state => Faker::Address.state,
		# 		:country => Faker::Address.country,
		# 		:zip_code => Faker::Address.zip_code,
		# 		:address => Faker::Address.street_address,
		# 		:is_available => [true, false].sample
		# 		)
		# end

		# 100.times do 
		# 	Listing.update_all(
		# 		:
		# 		)
		# end




		