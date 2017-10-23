require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get public_page" do
    get public_public_page_url
    assert_response :success
  end

end
