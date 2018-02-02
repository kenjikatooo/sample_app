# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :user_name => 'k.524.10nis@gmail.com',
    :password => 'k19960524',
    :domain => 'gmail.com',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
    
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
else
  ActionMailer::Base.delivery_method = :test
end