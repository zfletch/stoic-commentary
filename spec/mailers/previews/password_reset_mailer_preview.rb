# Preview all emails at http://localhost:3000/rails/mailers/password_reset_mailer
class PasswordResetMailerPreview < ActionMailer::Preview
  def forgot_password
    user = User.new(name: 'Test User', email: 'test@example.com')
    token = 'example-token'

    PasswordResetMailer.with(token: token, user: user).forgot_password
  end
end
