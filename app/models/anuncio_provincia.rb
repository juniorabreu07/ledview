class AnuncioProvincia < ActiveRecord::Base
  belongs_to :anuncio
  belongs_to :provincia
end