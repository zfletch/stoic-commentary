class PasswordResetMailer < ApplicationMailer
  def forgot_password
    @token = params[:token]
    @user = params[:user]

    mail(to: @user.email)
  end
end
