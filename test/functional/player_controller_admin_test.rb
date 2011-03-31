require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @hang_man = hang_men(:one)
    @cat = categories(:one)
    @subcat = subcategories(:one)
    @word = words(:one)
  end
  
  test "should get index admin" do
    get :index
    assert_response :success
  end
  
  test "should get choose admin" do
    post :choose
    assert_redirected_to player_url
  end
  
  test "should get choose2 admin" do
    post :choose, :LeaderBoard => "3"
    assert_redirected_to leaderboard_url
  end
  
end
