require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  setup do
    @category = {
      :category    => 'Movie'
    }
    @category2 = Category.new(@category)
    @category2.save
    @subcategory = {
      :categories_id    => @category2.id,
      :subcategory      => 'Action'
    }
    @update = {
      :categories_id    => @category2.id,
      :subcategory      => 'MyString'
    }
    @subcategory2 = Subcategory.new(@subcategory)
    @subcategory2.save
  end
  
  test "admin should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcategories)
  end
  
  test "admin should get new" do
    get :new
    assert_response :success
  end
  
  test "admin should create subcategory" do
    assert_difference('Subcategory.count') do
      post :create, :subcategory => @update
    end
    
    assert_redirected_to subcategory_path(assigns(:subcategory))
  end
  
  test "admin should show subcategory" do
    get :show, :id => @subcategory2.id
    assert_response :success
  end
  
  test "admin should get edit" do
    get :edit, :id => @subcategory2.id
    assert_response :success
  end
  
  test "admin should update subcategory" do
    put :update, :id => @subcategory2.id, :subcategory => @update
    assert_redirected_to subcategory_path(assigns(:subcategory))
  end
  
  test "admin should destroy subcategory" do
    assert_difference('Subcategory.count', -1) do
      delete :destroy, :id => @subcategory2.id
    end
    
    assert_redirected_to subcategories_path
  end
end
