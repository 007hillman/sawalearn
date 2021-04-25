# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:domain => 'gmial.com',
	:port => 587,
	:user_name => 'chriskeller619@gmail.com',
	:password => '@Leroyfer2',
	:authentication => 'plain',
	:ssl => true,
	:enable_starttls_auto => true
}

