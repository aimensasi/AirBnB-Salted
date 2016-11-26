CarrierWave.configure do |config|
	config.fog_provider = 'fog/aws'    
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWSAccessKeyId'],#security credentials of my created user "ABC" under my AWS account
      :aws_secret_access_key  => ENV['AWSSecretKey'], #security credentials of my created user "ABC" under my AWS account
      :region                 => 'ap-southeast-1' #my bucket country, i set to singapore, so its ap-southeast-1
  }
  config.fog_directory  = "airbnb-salted" #bucket name, for eg. : "my_pairbnb"
end