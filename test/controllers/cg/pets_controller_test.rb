require 'test_helper'

class Cg::PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cg_pets_new_url
    assert_response :success
  end

  test "should get edit" do
    get cg_pets_edit_url
    assert_response :success
  end

  test "should get mypage" do
    get cg_pets_mypage_url
    assert_response :success
  end

end
