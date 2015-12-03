json.array!(@pantallas) do |pantalla|
  json.extract! pantalla, :id, :tiempo, :provincia_id, :descripcion,:configurada,:Codigo
  json.url pantalla_url(pantalla, format: :json)
end
