require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index admin" do
    get :index
    assert_response :success
  end

end
