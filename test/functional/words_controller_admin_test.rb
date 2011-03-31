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
  
  test "should get index admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:words)
  end
  
  test "should create word admin" do
    assert_difference('Word.count') do
      post :create, :word => @update
    end
    
    assert_redirected_to word_path(assigns(:word))
  end
  
  test "should show word admin" do
    get :show, :id => @word.to_param
    assert_response :success
  end
  
  test "should update word admin" do
    put :update, :id => @word.to_param, :word => @update
    assert_redirected_to word_path(assigns(:word))
  end
  
  test "should destroy word admin" do
    assert_difference('Word.count', -1) do
      delete :destroy, :id => @word.to_param
    end
    
    assert_redirected_to words_path
  end
end
