require "test_helper"

class DocumentosLinPedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documentos_lin_pedido = documentos_lin_pedidos(:one)
  end

  test "should get index" do
    get documentos_lin_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_documentos_lin_pedido_url
    assert_response :success
  end

  test "should create documentos_lin_pedido" do
    assert_difference('DocumentosLinPedido.count') do
      post documentos_lin_pedidos_url, params: { documentos_lin_pedido: { cantidad: @documentos_lin_pedido.cantidad, codigo: @documentos_lin_pedido.codigo, descripcion: @documentos_lin_pedido.descripcion, id_pedido: @documentos_lin_pedido.id_pedido, porcentaje_iva: @documentos_lin_pedido.porcentaje_iva, valor_iva_unitario: @documentos_lin_pedido.valor_iva_unitario, valor_unitario: @documentos_lin_pedido.valor_unitario } }
    end

    assert_redirected_to documentos_lin_pedido_url(DocumentosLinPedido.last)
  end

  test "should show documentos_lin_pedido" do
    get documentos_lin_pedido_url(@documentos_lin_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_documentos_lin_pedido_url(@documentos_lin_pedido)
    assert_response :success
  end

  test "should update documentos_lin_pedido" do
    patch documentos_lin_pedido_url(@documentos_lin_pedido), params: { documentos_lin_pedido: { cantidad: @documentos_lin_pedido.cantidad, codigo: @documentos_lin_pedido.codigo, descripcion: @documentos_lin_pedido.descripcion, id_pedido: @documentos_lin_pedido.id_pedido, porcentaje_iva: @documentos_lin_pedido.porcentaje_iva, valor_iva_unitario: @documentos_lin_pedido.valor_iva_unitario, valor_unitario: @documentos_lin_pedido.valor_unitario } }
    assert_redirected_to documentos_lin_pedido_url(@documentos_lin_pedido)
  end

  test "should destroy documentos_lin_pedido" do
    assert_difference('DocumentosLinPedido.count', -1) do
      delete documentos_lin_pedido_url(@documentos_lin_pedido)
    end

    assert_redirected_to documentos_lin_pedidos_url
  end
end
