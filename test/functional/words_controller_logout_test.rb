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
  
  test "should get index logout" do
    session.delete :user_id
    get :index
    assert_redirected_to login_url
  end
  
  test "should get new logout" do
    session.delete :user_id
    get :new
    assert_redirected_to login_url
  end
  
  test "should create word logout" do
    session.delete :user_id
    assert_difference('Word.count',0) do
      post :create, :word => @update
    end
    assert_redirected_to login_url
  end
  
  test "should show word logout" do
    session.delete :user_id
    get :show, :id => @word.to_param
    assert_redirected_to login_url
  end
  
  test "should get edit logout" do
    session.delete :user_id
    get :edit, :id => @word.to_param
    assert_redirected_to login_url
  end
  
  test "should update word logout" do
    session.delete :user_id
    put :update, :id => @word.to_param, :word => @update
    assert_redirected_to login_url
  end
  
  test "should destroy word logout" do
    session.delete :user_id
    assert_difference('Word.count', 0) do
      delete :destroy, :id => @word.to_param
    end
    assert_redirected_to login_url
  end
end
