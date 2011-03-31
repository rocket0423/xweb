require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @update = {
      :category    => 'Family'
    }
  end
  
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get new logout" do
    session.delete :user_id
    get :new
    assert_redirected_to login_url
  end
  
  test "should create category logout" do
    session.delete :user_id
    assert_difference('Category.count',0) do
      post :create, :category => @update
    end
    assert_redirected_to login_url
  end
  
  test "should show category logout" do
    session.delete :user_id
    get :show, :id => @category.to_param
    assert_redirected_to login_url
  end
  
  test "should get edit logout" do
    session.delete :user_id
    get :edit, :id => @category.to_param
    assert_redirected_to login_url
  end
  
  test "should update category logout" do
    session.delete :user_id
    put :update, :id => @category.to_param, :category => @update
    assert_redirected_to login_url
  end
  
  test "should destroy category logout" do
    session.delete :user_id
    assert_difference('Category.count', 0) do
      delete :destroy, :id => @category.to_param
    end
    assert_redirected_to login_url
  end
end
