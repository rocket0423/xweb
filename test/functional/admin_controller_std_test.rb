require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_redirected_to player_url
  end

end
