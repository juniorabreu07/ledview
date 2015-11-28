class Anuncio < ActiveRecord::Base
  belongs_to :usuario
  has_many :anuncios_provincia
  has_many :provincias, through: :anuncios_provincia

  mount_uploader :cfile, ImageUploader
  mount_uploader :video, VideoUploader

  accepts_nested_attributes_for :anuncios_provincia, allow_destroy: true

end
