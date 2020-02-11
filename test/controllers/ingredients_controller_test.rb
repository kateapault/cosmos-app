require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredients_index_url
    assert_response :success
  end

  test "should get show" do
    get ingredients_show_url
    assert_response :success
  end

  test "should get new" do
    get ingredients_new_url
    assert_response :success
  end

  test "should get edit" do
    get ingredients_edit_url
    assert_response :success
  end

end
