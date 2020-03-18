class SessionsController < ApplicationController
  before_action :require_authentication, only: [:destroy]
  before_action :require_no_authentication, only: [:create]

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      sign_in(user)

      redirect_to return_path, t('success')
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(
      :email,
      :password,
    )
  end
end

