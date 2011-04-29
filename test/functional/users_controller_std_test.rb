require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "std get index should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_redirected_to player_url
  end
  
  test "std get new should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :new
    assert_redirected_to player_url
  end
  
  test "std create user should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count',0) do
      post :create, :user => @input_attributes
    end
    assert_redirected_to player_url
  end
  
  test "std get show should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @user.to_param
    assert_redirected_to player_url
  end
  
  test "std get edit should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @user.to_param
    assert_redirected_to player_url
  end
  
  test "std update user should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to player_url
  end
  
  test "std destroy user should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count', 0) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to player_url
  end
  
  test "std should destroy self then redirect to login" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count', -1) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
