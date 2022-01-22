require "application_system_test_case"

class DocumentosLinPedidosTest < ApplicationSystemTestCase
  setup do
    @documentos_lin_pedido = documentos_lin_pedidos(:one)
  end

  test "visiting the index" do
    visit documentos_lin_pedidos_url
    assert_selector "h1", text: "Documentos Lin Pedidos"
  end

  test "creating a Documentos lin pedido" do
    visit documentos_lin_pedidos_url
    click_on "New Documentos Lin Pedido"

    fill_in "Cantidad", with: @documentos_lin_pedido.cantidad
    fill_in "Codigo", with: @documentos_lin_pedido.codigo
    fill_in "Descripcion", with: @documentos_lin_pedido.descripcion
    fill_in "Id pedido", with: @documentos_lin_pedido.id_pedido
    fill_in "Porcentaje iva", with: @documentos_lin_pedido.porcentaje_iva
    fill_in "Valor iva unitario", with: @documentos_lin_pedido.valor_iva_unitario
    fill_in "Valor unitario", with: @documentos_lin_pedido.valor_unitario
    click_on "Create Documentos lin pedido"

    assert_text "Documentos lin pedido was successfully created"
    click_on "Back"
  end

  test "updating a Documentos lin pedido" do
    visit documentos_lin_pedidos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @documentos_lin_pedido.cantidad
    fill_in "Codigo", with: @documentos_lin_pedido.codigo
    fill_in "Descripcion", with: @documentos_lin_pedido.descripcion
    fill_in "Id pedido", with: @documentos_lin_pedido.id_pedido
    fill_in "Porcentaje iva", with: @documentos_lin_pedido.porcentaje_iva
    fill_in "Valor iva unitario", with: @documentos_lin_pedido.valor_iva_unitario
    fill_in "Valor unitario", with: @documentos_lin_pedido.valor_unitario
    click_on "Update Documentos lin pedido"

    assert_text "Documentos lin pedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Documentos lin pedido" do
    visit documentos_lin_pedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Documentos lin pedido was successfully destroyed"
  end
end
