require 'test_helper'

class GameControllerTest < ActionController::TestCase 
  test "should get index" do
    get :index
    assert_redirected_to player_url
  end

  test "should get update" do
    post :update
    assert_redirected_to player_url
  end

end
