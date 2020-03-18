module Authorizable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_authentication
    return if current_user

    session[:return_path] = request.fullpath if request.get? && !request.xhr?

    redirect_to root_path, notice: t('authorizable.unauthorized')
  end

  def require_no_authentication
    redirect_to root_path if current_user
  end

  def sign_in(user)
    session[:user_id] = user.id.to_s
  end

  def return_path
    session.delete(:return_path) || root_path
  end
end
