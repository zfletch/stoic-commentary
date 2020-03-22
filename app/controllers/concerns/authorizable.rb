module Authorizable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_no_authentication
    redirect_to root_path if current_user
  end

  def require_authentication
    return if current_user

    redirect_to new_sessions_path, notice: t('authorizable.unauthorized')
  end

  def require_admin_authentication
    return if current_user&.admin?

    redirect_to new_sessions_path, notice: t('authorizable.unauthorized')
  end

  def sign_in(user)
    session[:user_id] = user.id.to_s
  end
end
