require 'test_helper'

class WordsControllerTest < ActionController::TestCase
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
    @subcategory2 = Subcategory.new(@subcategory)
    @subcategory2.save
    @word = {
      :subcategories_id    => @subcategory2.id,
      :word                => 'Family',
      :hint                => 'Family',
      :points              => 10,
      :button_score        => 10,
      :letter_seq          => '111101111111010110111111111'
    }
    @update = {
      :subcategories_id    => @subcategory2.id,
      :word                => 'Test',
      :hint                => 'Test',
      :points              => 15,
      :button_score        => 15,
      :letter_seq          => '111101111111111111001111111'
    }
    @word2 = Word.new(@word)
    @word2.save
  end
  
  test "admin should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:words)
  end
  
  test "admin should get new" do
    get :new
    assert_response :success
  end
  
  test "admin should create word" do
    assert_difference('Word.count') do
      post :create, :word => @update
    end
    
    assert_redirected_to word_path(assigns(:word))
  end
  
  test "admin should show word" do
    get :show, :id => @word2.id
    assert_response :success
  end
  
  test "admin should get edit" do
    get :edit, :id => @word2.id
    assert_response :success
  end
  
  test "admin should update word" do
    put :update, :id => @word2.id, :word => @update
    assert_redirected_to word_path(assigns(:word))
  end
  
  test "admin should destroy word" do
    assert_difference('Word.count', -1) do
      delete :destroy, :id => @word2.id
    end
    
    assert_redirected_to words_path
  end
end
