require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "logout get new should redirect to login" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "logout should  get new" do
    session.delete :user_id
    get :new
    assert_response :success
  end
  
  test "logout should create user" do
    session.delete :user_id
    assert_difference('User.count') do
      post :create, :user => @input_attributes
    end
    assert_redirected_to player_url
  end
  
  test "logout get show should redirect to login" do
    session.delete :user_id
    get :show, :id => @user.to_param
    assert_redirected_to login_url
  end
  
  test "logout get edit should redirect to login" do
    session.delete :user_id
    get :edit, :id => @user.to_param
    assert_redirected_to login_url
  end
  
  test "logout put update should redirect to login" do
    session.delete :user_id
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to login_url
  end
  
  test "logout destroy user should redirect to login with same count" do
    session.delete :user_id
    assert_difference('User.count', 0) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to login_url
  end
  
  test "logout destroy self should redirect to login with same count" do
    session.delete :user_id
    assert_difference('User.count', 0) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
