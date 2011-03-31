require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  setup do
    @subcategory = subcategories(:one)
    @update = {
      :categories_id    => categories(:one).id,
      :subcategory      => 'Wonderful'
    }
  end
  
  test "should get index admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcategories)
  end
  
  test "should get new admin" do
    get :new
    assert_response :success
  end
  
  test "should create subcategory admin" do
    assert_difference('Subcategory.count') do
      post :create, :subcategory => @update
    end
    
    assert_redirected_to subcategory_path(assigns(:subcategory))
  end
  
  test "should show subcategory admin" do
    get :show, :id => @subcategory.to_param
    assert_response :success
  end
  
  test "should get edit admin" do
    get :edit, :id => @subcategory.to_param
    assert_response :success
  end
  
  test "should update subcategory admin" do
    put :update, :id => @subcategory.to_param, :subcategory => @update
    assert_redirected_to subcategory_path(assigns(:subcategory))
  end
  
  test "should destroy subcategory admin" do
    assert_difference('Subcategory.count', -1) do
      delete :destroy, :id => @subcategory.to_param
    end
    
    assert_redirected_to subcategories_path
  end
end
