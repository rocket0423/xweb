require 'test_helper'

class LeaderboardControllerTest < ActionController::TestCase
  test "should get index admin" do
    get :index
    assert_response :success
  end
  
  test "should get home admin" do
    post :home
    assert_redirected_to player_url
  end

end
