require "test_helper"

class ServicioControllerTest < ActionDispatch::IntegrationTest
  test "should get respuesta" do
    get servicio_respuesta_url
    assert_response :success
  end
end
