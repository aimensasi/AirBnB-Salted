Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, ENV["FACEBOOK_ID"], ENV["FACEBOOK_SECRET"], 
   					info_fields: 'first_name,last_name,email,gender,birthday', 
   					image_size: 'large' 
end