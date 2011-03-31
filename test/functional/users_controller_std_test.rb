require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      :name                  => "sam",
      :password              => "private",
      :password_confirmation => "private",
    }
    
    @user = users(:one)
  end
  
  test "should get index std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_redirected_to player_url
  end
  
  test "should get new std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :new
    assert_redirected_to player_url
  end
  
  test "should create user std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count',0) do
      post :create, :user => @input_attributes
    end
    assert_redirected_to player_url
  end
  
  test "should show user std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @user.to_param
    assert_redirected_to player_url
  end
  
  test "should get edit std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @user.to_param
    assert_redirected_to player_url
  end
  
  test "should update user std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to player_url
  end
  
  test "should destroy user std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count', 0) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to player_url
  end
  
  test "should destroy self std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('User.count', -1) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
