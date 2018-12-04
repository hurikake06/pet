require 'test_helper'

class Cg::SharesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cg_shares_new_url
    assert_response :success
  end

  test "should get list" do
    get cg_shares_list_url
    assert_response :success
  end

  test "should get show" do
    get cg_shares_show_url
    assert_response :success
  end

end
