require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @update = {
      :category    => 'Family'
    }
  end
  
  test "should get index admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end
  
  test "should get new admin" do
    get :new
    assert_response :success
  end
  
  test "should create category admin" do
    assert_difference('Category.count') do
      post :create, :category => @update
    end
    
    assert_redirected_to category_path(assigns(:category))
  end
  
  test "should show category admin" do
    get :show, :id => @category.to_param
    assert_response :success
  end
  
  test "should get edit admin" do
    get :edit, :id => @category.to_param
    assert_response :success
  end
  
  test "should update category admin" do
    put :update, :id => @category.to_param, :category => @update
    assert_redirected_to category_path(assigns(:category))
  end
  
  test "should destroy category admin" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => @category.to_param
    end
    
    assert_redirected_to categories_path
  end
end
