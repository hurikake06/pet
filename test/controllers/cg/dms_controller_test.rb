require 'test_helper'

class Cg::DmsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cg_dms_new_url
    assert_response :success
  end

end
