require 'test_helper'

class PlayerControllerTest < ActionController::TestCase  
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
  
  test "should get choose3 admin" do
    post :choose, :SubmitChoice => "1" , :SubCat => words(:one).subcategories_id, :HangMan => hang_men(:one).id
    assert_redirected_to game_url
  end
  
  test "should go to game admin" do
    session.delete :user_id
    session[:user_id] = users(:five).id
    post :choose, :PrevGame => "2"
    assert_redirected_to game_url
  end
  
  # not recognizing id values of words that were stored in users
  #test "should go to game2 admin" do
  #  session.delete :user_id
  #  session[:user_id] = users(:five).id
  #  post :choose, :SubmitChoice => "1" , :SubCat => words(:one).subcategories_id, :HangMan => hang_men(:one).id
  #  assert_redirected_to game_url
  #end

end
