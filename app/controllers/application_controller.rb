class ApplicationController < ActionController::Base
  include Authorizable

  add_flash_types :notice, :success, :error, :alert
end
