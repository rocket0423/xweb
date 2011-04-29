require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  test "logout get index should redirect to login" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "logout get new should redirect to login" do
    session.delete :user_id
    get :new
    assert_redirected_to login_url
  end
  
  test "logout create subcategory should redirect to login no create" do
    session.delete :user_id
    assert_difference('Subcategory.count',0) do
      post :create, :subcategory => @update
    end
    assert_redirected_to login_url
  end
  
  test "logout get show should redirect to login" do
    session.delete :user_id
    get :show, :id => @subcategory2.id
    assert_redirected_to login_url
  end
  
  test "logout get edit should redirect to login" do
    session.delete :user_id
    get :edit, :id => @subcategory2.id
    assert_redirected_to login_url
  end
  
  test "logout put update should redirect to login" do
    session.delete :user_id
    put :update, :id => @subcategory2.id, :subcategory => @update
    assert_redirected_to login_url
  end
  
  test "logout destroy subcategory should redirect to login with same count" do
    session.delete :user_id
    assert_difference('Subcategory.count', 0) do
      delete :destroy, :id => @subcategory2.id
    end
    assert_redirected_to login_url
  end
end
