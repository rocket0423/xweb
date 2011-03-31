require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  setup do
    @word = words(:one)
    @update = {
      :subcategories_id    => subcategories(:one).id,
      :word                => 'Family',
      :hint                => 'Family'
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
  
  test "should create word std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Word.count',0) do
      post :create, :word => @update
    end
    assert_redirected_to player_url
  end
  
  test "should show word std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @word.to_param
    assert_redirected_to player_url
  end
  
  test "should get edit std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @word.to_param
    assert_redirected_to player_url
  end
  
  test "should update word std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @word.to_param, :word => @update
    assert_redirected_to player_url
  end
  
  test "should destroy word std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Word.count', 0) do
      delete :destroy, :id => @word.to_param
    end
    assert_redirected_to player_url
  end
end
