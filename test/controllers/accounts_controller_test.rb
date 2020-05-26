require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get accounts_login_url
    assert_response :success
  end

  test "should get loginMess" do
    get accounts_loginMess_url
    assert_response :success
  end

  test "should get signupMess" do
    get accounts_signupMess_url
    assert_response :success
  end

  test "should get signupStudent" do
    get accounts_signupStudent_url
    assert_response :success
  end

end
