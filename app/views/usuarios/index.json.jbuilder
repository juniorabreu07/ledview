json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :apellido, :direccion, :telefono, :email, :username, :admin
  json.url usuario_url(usuario, format: :json)
end
