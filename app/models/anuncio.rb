class Anuncio < ActiveRecord::Base
  belongs_to :cliente
  has_many :anuncios_provincia
  has_many :provincias, through: :anuncios_provincia
end
