require 'test_helper'

class PatronsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get patrons_show_url
    assert_response :success
  end

  test "should get edit" do
    get patrons_edit_url
    assert_response :success
  end

  test "should get update" do
    get patrons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get patrons_destroy_url
    assert_response :success
  end

end
