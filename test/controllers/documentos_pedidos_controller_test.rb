require "test_helper"

class DocumentosPedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get documentos_pedidos_index_url
    assert_response :success
  end

  test "should get new" do
    get documentos_pedidos_new_url
    assert_response :success
  end

  test "should get create" do
    get documentos_pedidos_create_url
    assert_response :success
  end

  test "should get edit" do
    get documentos_pedidos_edit_url
    assert_response :success
  end
end
