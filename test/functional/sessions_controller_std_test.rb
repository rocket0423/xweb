require 'test_helper'

class SessionsControllerTest < ActionController::TestCase  
  test "std get new should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :new
    assert_redirected_to player_url
  end
  
  test "std login should redirect to player no change" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    dave = users(:one)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to player_url
    assert_not_equal dave.id, session[:user_id]
  end
  
  test "std should logout then redirect to login" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    delete :destroy
    assert_redirected_to login_url
  end
  
end
