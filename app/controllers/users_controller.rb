class UsersController < ApplicationController
  before_action :require_authentication, only: [:edit, :update]
  before_action :require_no_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if user.save
      sign_in(user)

      redirect_to root_path, success: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_path, success: t('.success')
    else
      render :edit
    end
  end

  private

  attr_reader :user

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation,
    ).delete_if { |_k, v| v.blank? }
  end
end
