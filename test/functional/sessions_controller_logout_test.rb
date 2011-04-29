require 'test_helper'

class SessionsControllerTest < ActionController::TestCase  
  test "logout should get new" do
    session.delete :user_id
    get :new
    assert_response :success
  end
  
  test "logout should login admin" do
    session.delete :user_id
    dave = users(:one)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "logout should login std" do
    session.delete :user_id
    dave = users(:three)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to player_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "logout should fail login" do
    session.delete :user_id
    dave = users(:one)
    post :create, :name => dave.name, :password => 'wrong'
    assert_redirected_to login_url
  end
  
  test "logout should logout then redirect to login" do
    session.delete :user_id
    delete :destroy
    assert_redirected_to login_url
  end
  
end
