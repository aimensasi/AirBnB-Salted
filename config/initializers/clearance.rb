Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
end

Clearance::SessionsController.layout "logged_out"
Clearance::UsersController.layout "logged_out"