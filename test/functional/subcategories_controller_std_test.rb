require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  test "std get index should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :index
    assert_redirected_to player_url
  end
  
  test "std get new should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :new
    assert_redirected_to player_url
  end
  
  test "std create subcategory should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Subcategory.count',0) do
      post :create, :subcategory => @update
    end
    assert_redirected_to player_url
  end
  
  test "std get show should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @subcategory2.id
    assert_redirected_to player_url
  end
  
  test "std get edit should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @subcategory2.id
    assert_redirected_to player_url
  end
  
  test "std update subcategory should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @subcategory2.id, :subcategory => @update
    assert_redirected_to player_url
  end
  
  test "std destroy subcategory should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Subcategory.count', 0) do
      delete :destroy, :id => @subcategory2.id
    end
    assert_redirected_to player_url
  end
end
