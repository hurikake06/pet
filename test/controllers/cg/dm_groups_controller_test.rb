require 'test_helper'

class Cg::DmGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get cg_dm_groups_list_url
    assert_response :success
  end

  test "should get new" do
    get cg_dm_groups_new_url
    assert_response :success
  end

end
