Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = ENV['MerchantID']
Braintree::Configuration.public_key = ENV['PublicKey']
Braintree::Configuration.private_key = ENV['PrivateKey']
