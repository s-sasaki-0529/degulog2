require 'test_helper'

class BoughtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boughts_index_url
    assert_response :success
  end

end
