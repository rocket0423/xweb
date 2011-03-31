require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  setup do
    @subcategory = subcategories(:one)
    @update = {
      :categories_id    => categories(:one).id,
      :subcategory      => 'Wonderful'
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
  
  test "should create subcategory std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Subcategory.count',0) do
      post :create, :subcategory => @update
    end
    assert_redirected_to player_url
  end
  
  test "should show subcategory std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @subcategory.to_param
    assert_redirected_to player_url
  end
  
  test "should get edit std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @subcategory.to_param
    assert_redirected_to player_url
  end
  
  test "should update subcategory std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @subcategory.to_param, :subcategory => @update
    assert_redirected_to player_url
  end
  
  test "should destroy subcategory std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Subcategory.count', 0) do
      delete :destroy, :id => @subcategory.to_param
    end
    assert_redirected_to player_url
  end
end
