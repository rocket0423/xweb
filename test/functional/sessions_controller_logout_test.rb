require 'test_helper'

class SessionsControllerTest < ActionController::TestCase  
  test "should get new logout" do
    session.delete :user_id
    get :new
    assert_response :success
  end
  
  test "should login admin logout" do
    session.delete :user_id
    dave = users(:one)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "should login std logout" do
    session.delete :user_id
    dave = users(:three)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to player_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "should fail login logout" do
    session.delete :user_id
    dave = users(:one)
    post :create, :name => dave.name, :password => 'wrong'
    assert_redirected_to login_url
  end
  
  test "should logout logout" do
    session.delete :user_id
    delete :destroy
    assert_redirected_to login_url
  end
  
end
