class ApplicationMailer < ActionMailer::Base
  default from: 'support@epictetos.herokuapp.com'

  layout 'mailer'
end
