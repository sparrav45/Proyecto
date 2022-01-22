json.extract! usuario, :id, :cedula, :nombre, :apellido, :email, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
