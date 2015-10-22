json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :apellido, :direccion, :email,:cedula,:username
  json.url cliente_url(cliente, format: :json)
end
