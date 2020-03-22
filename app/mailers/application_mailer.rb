class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.from_email
  layout 'mailer'
end
