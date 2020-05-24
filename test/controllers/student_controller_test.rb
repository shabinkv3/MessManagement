require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboardd" do
    get student_dashboardd_url
    assert_response :success
  end

end
