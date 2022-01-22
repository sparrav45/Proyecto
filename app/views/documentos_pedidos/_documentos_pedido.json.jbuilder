json.extract! documentos_pedido, :id, :nit, :tercero, :id_clase, :clase, :iva, :valor_total,:usuario_id,:estado_id
json.url usuario_url(documentos_pedido, format: :json)
