require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  setup do
    @subcategory = subcategories(:one)
    @update = {
      :categories_id    => categories(:one).id,
      :subcategory      => 'Wonderful'
    }
  end
  
  test "should get index " do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get new logout" do
    session.delete :user_id
    get :new
    assert_redirected_to login_url
  end
  
  test "should create subcategory logout" do
    session.delete :user_id
    assert_difference('Subcategory.count',0) do
      post :create, :subcategory => @update
    end
    assert_redirected_to login_url
  end
  
  test "should show subcategory logout" do
    session.delete :user_id
    get :show, :id => @subcategory.to_param
    assert_redirected_to login_url
  end
  
  test "should get edit logout" do
    session.delete :user_id
    get :edit, :id => @subcategory.to_param
    assert_redirected_to login_url
  end
  
  test "should update subcategory logout" do
    session.delete :user_id
    put :update, :id => @subcategory.to_param, :subcategory => @update
    assert_redirected_to login_url
  end
  
  test "should destroy subcategory logout" do
    session.delete :user_id
    assert_difference('Subcategory.count', 0) do
      delete :destroy, :id => @subcategory.to_param
    end
    assert_redirected_to login_url
  end
end
