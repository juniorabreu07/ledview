class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, class_name: "Role"

  def admin?
    role.nombre == "admin"
  end

  def cliente?
    role.nombre == "cliente"
  end


end
