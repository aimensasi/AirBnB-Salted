class ApplicationMailer < ActionMailer::Base
  default from: "salted@airbnb.com"
  layout 'mailer'
end
