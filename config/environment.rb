# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'bootstrap-series-assignment2.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

SENDGRID_USERNAME=apikey
SENDGRID_PASSWORD=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