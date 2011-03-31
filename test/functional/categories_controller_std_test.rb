require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @update = {
      :category    => 'Family'
    }
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
  
  test "should create category std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Category.count',0) do
      post :create, :category => @update
    end
    assert_redirected_to player_url
  end
  
  test "should show category std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @category.to_param
    assert_redirected_to player_url
  end
  
  test "should get edit std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @category.to_param
    assert_redirected_to player_url
  end
  
  test "should update category std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @category.to_param, :category => @update
    assert_redirected_to player_url
  end
  
  test "should destroy category std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Category.count', 0) do
      delete :destroy, :id => @category.to_param
    end
    assert_redirected_to player_url
  end
end
