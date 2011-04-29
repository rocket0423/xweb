require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
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
  
  test "std create category should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Category.count',0) do
      post :create, :category => @update
    end
    assert_redirected_to player_url
  end
  
  test "std get show should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @category2.id
    assert_redirected_to player_url
  end
  
  test "std get edit should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @category2.id
    assert_redirected_to player_url
  end
  
  test "std update category should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @category2.id, :category => @update
    assert_redirected_to player_url
  end
  
  test "std destroy category should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Category.count', 0) do
      delete :destroy, :id => @category2.id
    end
    assert_redirected_to player_url
  end
end
