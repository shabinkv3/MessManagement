require 'test_helper'

class MessControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get mess_dashboard_url
    assert_response :success
  end

end
