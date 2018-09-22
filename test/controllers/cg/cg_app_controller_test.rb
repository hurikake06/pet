require 'test_helper'

class Cg::CgAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cg_cg_app_index_url
    assert_response :success
  end

end
