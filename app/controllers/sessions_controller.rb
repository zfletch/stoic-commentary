class SessionsController < ApplicationController
  before_action :require_authentication, only: [:destroy]
  before_action :require_no_authentication, only: [:new, :create]

  def new
    @user_session = Session.new
  end

  def create
    @user_session = Session.new(session_params)

    if user_session.valid?
      sign_in(user_session.user)

      redirect_to root_path, success: t('.success')
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: t('.sign_out')
  end

  private

  attr_reader :user_session

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
