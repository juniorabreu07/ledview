class Anuncio < ActiveRecord::Base
  belongs_to :cliente
  has_many :anuncios_provincia
  has_many :provincias, through: :anuncios_provincia

  accepts_nested_attributes_for :anuncios_provincia, allow_destroy: true

end
