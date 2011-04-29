require 'test_helper'

class WordsControllerTest < ActionController::TestCase
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
  
  test "logout word category should redirect to login no create" do
    session.delete :user_id
    assert_difference('Word.count',0) do
      post :create, :word => @update
    end
    assert_redirected_to login_url
  end
  
  test "logout get show should redirect to login" do
    session.delete :user_id
    get :show, :id => @word2.id
    assert_redirected_to login_url
  end
  
  test "logout get edit should redirect to login" do
    session.delete :user_id
    get :edit, :id => @word2.id
    assert_redirected_to login_url
  end
  
  test "logout put update should redirect to login" do
    session.delete :user_id
    put :update, :id => @word2.id, :word => @update
    assert_redirected_to login_url
  end
  
  test "logout destroy word should redirect to login with same count" do
    session.delete :user_id
    assert_difference('Word.count', 0) do
      delete :destroy, :id => @word2.id
    end
    assert_redirected_to login_url
  end
end
