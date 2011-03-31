require 'test_helper'

class LeaderboardControllerTest < ActionController::TestCase
  test "should get index std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_response :success
  end

  test "should get home std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    post :home
    assert_redirected_to player_url
  end
end
