# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
