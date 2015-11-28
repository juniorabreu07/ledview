class InicioController < ApplicationController

  def index
    if signed_in?
      if current_usuario.admin?
        redirect_to :admin
      end
    else
      redirect_to :root
      puts "#{__method__}************************"
      puts "salida"
      puts "************************"
    end
  end

  def cliente
  end

  def admin  
  end
end
