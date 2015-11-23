class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  devise_group :person, contains: [:cliente, :usuario]
  before_action :authenticate_person! # Ensure someone is logged in

  alias_method :current_user, :current_usuario

  protect_from_forgery with: :exception
end
