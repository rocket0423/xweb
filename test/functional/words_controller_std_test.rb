require 'test_helper'

class WordsControllerTest < ActionController::TestCase
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
  
  test "std create world should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Word.count',0) do
      post :create, :word => @update
    end
    assert_redirected_to player_url
  end
  
  test "std get show should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @word2.id
    assert_redirected_to player_url
  end
  
  test "std get edit should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @word2.id
    assert_redirected_to player_url
  end
  
  test "std update word should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @word2.id, :word => @update
    assert_redirected_to player_url
  end
  
  test "std destroy category should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('Word.count', 0) do
      delete :destroy, :id => @word2.id
    end
    assert_redirected_to player_url
  end
end
