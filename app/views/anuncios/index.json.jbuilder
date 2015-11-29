json.array!(@anuncios) do |anuncio|
  json.extract! anuncio, :id, :descripcion, :texto, :usuario_id, :estado, :fecha_end, :hora, :precio, :cfile,:tipo
  json.url anuncio_url(anuncio, format: :json)
end
