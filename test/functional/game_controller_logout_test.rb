require 'test_helper'

class GameControllerTest < ActionController::TestCase 
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end

  test "should get update logout" do
    session.delete :user_id
    post :update
    assert_redirected_to login_url
  end

end
