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
  
  test "admin should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test "admin should get new" do
    get :new
    assert_response :success
  end
  
  test "admin should create user" do
    assert_difference('User.count') do
      post :create, :user => @input_attributes
    end
    
    assert_redirected_to user_path(assigns(:user))
  end
  
  test "admin should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end
  
  test "admin should get edit" do
    get :edit, :id => @user.to_param
    assert_response :success
  end
  
  test "admin should update user" do
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_redirected_to user_path
  end
  
  test "admin should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end
    assert_redirected_to login_path
  end
  
  test "admin should destroy self then redirect to login" do
    assert_difference('User.count', -1) do
      delete :dself
    end
    assert_redirected_to login_path
  end
end
