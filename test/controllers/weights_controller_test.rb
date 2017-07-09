require 'test_helper'

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weights_index_url
    assert_response :success
  end

end
