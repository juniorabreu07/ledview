class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :update_sanitized_params, if: :devise_controller?

  before_filter :authenticate_usuario!#, except: :pantalla # Ensure someone is logged in

  def set_usuario
    if current_usuario.nil?
      current_cliente
    else
      current_usuario
    end
  end

  protect_from_forgery with: :exception

  alias_method :current_user, :set_usuario

  #  method to sanitized params for devise user sign up
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:cedula,:username,:email,:password, :password_confirmation,:nombre,:apellido,:direccion)}
  end

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

end
