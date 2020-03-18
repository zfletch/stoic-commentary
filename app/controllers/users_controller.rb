class UsersController < ApplicationController
  before_action :require_authentication, only: [:edit, :update]
  before_action :require_no_authentication, only: [:new, :create]
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if user.save
      redirect_to root, notice: t('success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to root, notice: t('.success')
    else
      render :edit
    end
  end


  private

  attr_reader :user

  def ser_user
    @user ||= User.find_by!(id: params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation,
    )
  end
end
