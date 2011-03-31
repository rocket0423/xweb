require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get choose logout" do
    session.delete :user_id
    post :choose
    assert_redirected_to login_url
  end
  
end
