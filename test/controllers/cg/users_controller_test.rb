require 'test_helper'

class Cg::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cg_users_new_url
    assert_response :success
  end

  test "should get login" do
    get cg_users_login_url
    assert_response :success
  end

  test "should get mypage" do
    get cg_users_mypage_url
    assert_response :success
  end

end
