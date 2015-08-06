# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Specify ActionMailer settings to point to SendGrid’s servers
ActionMailer::Base.smtp_settings = {
  :user_name => 'llamle',
  :password => 'perfectpass1',
  :domain => 'perfectrez.heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
