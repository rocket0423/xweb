require 'test_helper'

class GameControllerTest < ActionController::TestCase 
  test "should get index std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_redirected_to player_url
  end

  test "should get update std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    post :update
    assert_redirected_to player_url
  end

end
