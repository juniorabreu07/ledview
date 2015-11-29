class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, class_name: "Role"

  has_many :anuncios


  def anuncios
    if self.admin?
      Anuncio.all
    else
      super
    end
  end

  def admin?
    role.nombre == "admin"
  end

  def cliente?
    role.nombre == "cliente"
  end

end
