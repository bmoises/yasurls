require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get redirect" do
    get :redirect
    assert_response :success
  end

end
