json.array!(@anuncios) do |anuncio|
  json.extract! anuncio, :id, :descripcion, :texto, :cliente_id, :estado, :fecha_end, :hora, :precio, :cfile,:tipo
  json.url anuncio_url(anuncio, format: :json)
end
