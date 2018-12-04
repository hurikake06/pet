require 'test_helper'

class Cg::EvsControllerTest < ActionDispatch::IntegrationTest
  test "should get host_new" do
    get cg_evs_host_new_url
    assert_response :success
  end

  test "should get user_new" do
    get cg_evs_user_new_url
    assert_response :success
  end

end
