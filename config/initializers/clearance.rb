Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
end

Clearance::SessionsController.layout "alt_layout"
Clearance::UsersController.layout "alt_layout"