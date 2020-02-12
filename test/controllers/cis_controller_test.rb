require 'test_helper'

class CisControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get cis_search_url
    assert_response :success
  end

  test "should get index" do
    get cis_index_url
    assert_response :success
  end

end
