require 'test_helper'

class SessionsControllerTest < ActionController::TestCase  
  test "should get new admin" do
    get :new
    assert_redirected_to player_url
  end
  
  test "should login admin" do
    dave = users(:two)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to player_url
    assert_not_equal dave.id, session[:user_id]
  end
  
  test "should logout admin" do
    delete :destroy
    assert_redirected_to login_url
  end
  
end
