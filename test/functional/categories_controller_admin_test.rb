require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = {
      :category    => 'Movie'
    }
    @update = {
      :category    => 'Music'
    }
    @category2 = Category.new(@category)
    @category2.save
  end
  
  test "admin should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end
  
  test "admin should get new" do
    get :new
    assert_response :success
  end
  
  test "admin should create category" do
    assert_difference('Category.count') do
      post :create, :category => @update
    end
    
    assert_redirected_to category_path(assigns(:category))
  end
  
  test "admin should show category" do
    get :show, :id => @category2.id
    assert_response :success
  end
  
  test "admin should get edit" do
    get :edit, :id => @category2.id
    assert_response :success
  end
  
  test "admin should update category" do
    put :update, :id => @category2.id, :category => @update
    assert_redirected_to category_path(assigns(:category))
  end
  
  test "admin should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => @category2.id
    end
    
    assert_redirected_to categories_path
  end
end
