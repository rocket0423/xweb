require 'test_helper'

class PlayerControllerTest < ActionController::TestCase  
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
    @word2 = Word.new(@word)
    @word2.save
    @hangman = {
        :name       => 'HangMe',
        :hang1_url  => 'Hangman1.jpg',
        :hang2_url  => 'Hangman2.jpg',
        :hang3_url  => 'Hangman3.jpg',
        :hang4_url  => 'Hangman4.jpg',
        :hang5_url  => 'Hangman5.jpg',
        :hang6_url  => 'Hangman6.jpg',
        :hang7_url  => 'Hangman7.jpg'
    }
    @hangman2 = HangMan.new(@hangman)
    @hangman2.save
    @users = {
      :name             => 'daves',
      :hashed_password  => "<%= User.encrypt_password('secret', SALT) %>",
      :salt             => "<%= SALT %>",
      :administrator    => true,
      :active           => '111111111111111111111111111',
      :active2          => '111111111111111111111111111',
      :hangman_id       => @hangman2.id,
      :word_id          => @word2.id,
      :score            => 0
    }
    @users2 = {
      :name             => 'guess',
      :hashed_password  => "<%= User.encrypt_password('secret', SALT) %>",
      :salt             => "<%= SALT %>",
      :administrator    => true,
      :score            => 0
    }
    @user = User.new(@users)
    @user.save
    @user2 = User.new(@users2)
    @user2.save
  end
  test "admin should get index" do
    get :index
    assert_response :success
  end
  
  test "admin should get choose" do
    post :choose
    assert_redirected_to player_url
  end
  
  test "admin should get choose Leaderboard" do
    post :choose, :LeaderBoard => "3"
    assert_redirected_to leaderboard_url
    post :choose, :LeaderBoard => "4"
    assert_redirected_to player_url
    post :choose, :LeaderBoard => nil
    assert_redirected_to player_url
  end
  
  test "admin should go to prevGame" do
    session.delete :user_id
    session[:user_id] = @user.id
    post :choose, :PrevGame => "2"
    assert_redirected_to game_url
    post :choose, :PrevGame => "1"
    assert_redirected_to player_url
    post :choose, :PrevGame => nil
    assert_redirected_to player_url
  end
  
  test "admin should create new game then to game with current" do
    session.delete :user_id
    session[:user_id] = @user.id
    post :choose, :SubmitChoice =>"1"
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"jason"
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => 10
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => "5"
    assert_redirected_to player_url
    #post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id, :HangMan => @hangman2.id
    #assert_redirected_to game_url
    post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id, :HangMan => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => nil, :HangMan => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => "5", :HangMan => @hangman2.id
    assert_redirected_to player_url
  end
  
  test "admin should create new game then to game with no current" do
    session.delete :user_id
    session[:user_id] = @user2.id
    post :choose, :SubmitChoice =>"1"
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"jason"
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => 10
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => "5"
    assert_redirected_to player_url
    #post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id, :HangMan => @hangman2.id
    #assert_redirected_to game_url
    post :choose, :SubmitChoice =>"1", :SubCat => @subcategory2.id, :HangMan => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => nil, :HangMan => nil
    assert_redirected_to player_url
    post :choose, :SubmitChoice =>"1", :SubCat => "5", :HangMan => @hangman2.id
    assert_redirected_to player_url
  end
  
end
