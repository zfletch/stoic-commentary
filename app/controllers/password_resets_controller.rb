class PasswordResetsController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create, :show]

  def new
    @password_reset = PasswordReset.new
  end

  def create
    @password_reset = PasswordReset.new(password_reset_params)

    if password_reset.valid?
      password_reset.set_token!

      notify_user!

      redirect_to root_path, notice: t('.created')
    else
      render :new
    end
  end

  def show
    @password_reset = PasswordReset.new(token: params[:token])
    password_reset.user_from_token!

    if password_reset.valid?
      sign_in(password_reset.user)

      redirect_to edit_user_path, notice: t('.reset_password')
    else
      redirect_to new_session_path, error: t('.invalid_token')
    end
  end

  private

  attr_reader :password_reset

  def password_reset_params
    params.require(:password_reset).permit(:email)
  end

  def user_params
    params.require(:password_reset).permit(:password, :password_confirmation)
  end

  def notify_user!
    PasswordResetMailer.with(token: @password_reset.token, user: @password_reset.user).forgot_password.deliver_later
  end
end
