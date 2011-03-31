require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  test "should get index std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_response :success
  end
  
  test "should get choose std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    post :choose
    assert_redirected_to player_url
  end
  
  test "should get choose2 std" do
    post :choose, :LeaderBoard => "3"
    assert_redirected_to leaderboard_url
  end
  
end
