require 'test_helper'

class DispatchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dispatch_index_url
    assert_response :success
  end

end
