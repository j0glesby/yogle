# Email settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "yoglesoft.com",
  :authentication => :plain,
  :user_name => "support@yoglesoft.com",
  :password => "y0gles0ft2009!"  
}