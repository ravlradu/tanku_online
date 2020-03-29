# Load the Rails application.
require_relative 'application'

# ActionMailer::Base.smtp_settings = {
#     :user_name => 'apikey', #ENV['SENDGRID_USERNAME'] || Rails.application.credentials.dig(:sendgrid, :username),
#     :password => ENV['SENDGRID_API_KEY'] || Rails.application.credentials.dig(:sendgrid, :api_key),
#     :domain => 'alxx.se',
#     :address => 'smtp.sendgrid.net',
#     :port => 25,
#     :authentication => :login,
#     :enable_starttls_auto => true
# }

ActionMailer::Base.smtp_settings = {
    :user_name => Rails.application.credentials.dig(:mailgun, :username),
    :password => Rails.application.credentials.dig(:mailgun, :password),
    :domain => 'sandbox76dc24812f0041079290acf38664dc79.mailgun.org',
    :address => 'smtp.mailgun.org',
    :port => 587,
    :authentication => :login,
    :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
