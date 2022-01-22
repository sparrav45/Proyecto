json.extract! documentos_lin_pedido, :id, :codigo, :descripcion, :id_pedido, :valor_unitario, :porcentaje_iva, :valor_iva_unitario, :cantidad, :created_at, :updated_at
json.url documentos_lin_pedido_url(documentos_lin_pedido, format: :json)
