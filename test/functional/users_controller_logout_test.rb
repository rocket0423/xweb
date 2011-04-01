require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      :name                  => "sam",
      :password              => "private",
      :password_confirmation => "private",
      :score                 => 0
    }
    @user = users(:one)
  end
  
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get new logout" do
    session.delete :user_id
    get :new
    assert_response :success
  end
  
  test "should create user logout" do
    session.delete :user_id
    assert_difference('User.count') do
      post :create, :user => @input_attributes
    end
    assert_redirected_to player_url
  end
  
  test "should show user logout" do
    session.delete :user_id
    get :show, :id => @user.to_param
    assert_redirected_to login_url
  end
  
  test "should get edit logout" do
    session.delete :user_id
    get :edit, :id => @user.to_param
    assert_redirected_to login_url
  end
  
  test "should update user logout" do
    session.delete :user_id
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to login_url
  end
  
  test "should destroy user logout" do
    session.delete :user_id
    assert_difference('User.count', 0) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to login_url
  end
  
  test "should destroy self logout" do
    session.delete :user_id
    assert_difference('User.count', 0) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
