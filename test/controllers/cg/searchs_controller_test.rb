require 'test_helper'

class Cg::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cg_searchs_index_url
    assert_response :success
  end

end
