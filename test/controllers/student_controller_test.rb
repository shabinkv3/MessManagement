require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get student_dashboard_url
    assert_response :success
  end

end
