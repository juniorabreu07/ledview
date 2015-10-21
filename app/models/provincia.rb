class Provincia < ActiveRecord::Base
  has_many :pantallas
  has_many :anuncios_provincia
  has_many :anuncio, through: :anuncios_provincia
end
