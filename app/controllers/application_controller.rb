class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_usuario! # Ensure someone is logged in

  alias_method :current_user, :current_usuario

  protect_from_forgery with: :exception

  
end
