class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_usuario! # Ensure someone is logged in

  layout :layout_by_resource

  alias_method :current_user, :current_usuario

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end


  def layout_by_resource
    if devise_controller? && resource_name == :usuario
      "devise"
    else
      "application"
    end
  end

  # before_filter do
  #   resource = controller_name.singularize.to_sym
  #   method = "#{resource}_params"
  #   params[resource] &&= send(method) if respond_to?(method, true)
  # end
  
end
