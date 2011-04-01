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
  
  test "should get index admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test "should get new admin" do
    get :new
    assert_response :success
  end
  
  test "should create user admin" do
    assert_difference('User.count') do
      post :create, :user => @input_attributes
    end
    
    assert_redirected_to user_path(assigns(:user))
  end
  
  test "should show user admin" do
    get :show, :id => @user.to_param
    assert_response :success
  end
  
  test "should get edit admin" do
    get :edit, :id => @user.to_param
    assert_response :success
  end
  
  test "should update user admin" do
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to user_path
  end
  
  test "should destroy user admin" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to login_path
  end
  
  test "should destroy self admin" do
    assert_difference('User.count', -1) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
