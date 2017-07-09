require 'test_helper'

class DegusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get degus_index_url
    assert_response :success
  end

end
