require 'test_helper'

class LeaderboardControllerTest < ActionController::TestCase
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get home logout" do
    session.delete :user_id
    post :home
    assert_redirected_to login_url
  end
  
end
