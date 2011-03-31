require 'test_helper'

class HangMenControllerTest < ActionController::TestCase
  setup do
    @hang_man = hang_men(:one)
    @update = {
      :name         => 'Hanging',
      :hang1_url    => '/images/hangman1/533hangman-step1.jpg',
      :hang2_url    => '/images/hangman1/533hangman-step2.jpg',
      :hang3_url    => '/images/hangman1/533hangman-step3.jpg',
      :hang4_url    => '/images/hangman1/533hangman-step4.jpg',
      :hang5_url    => '/images/hangman1/533hangman-step5.jpg',
      :hang6_url    => '/images/hangman1/533hangman-step6.jpg',
      :hang7_url    => '/images/hangman1/533hangman-step7.jpg'
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
  
  test "should create hang_man std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('HangMan.count',0) do
      post :create, :hang_man => @update
    end
    assert_redirected_to player_url
  end
  
  test "should show hang_man std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @hang_man.to_param
    assert_redirected_to player_url
  end
  
  test "should get edit std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @hang_man.to_param
    assert_redirected_to player_url
  end
  
  test "should update hang_man std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @hang_man.to_param, :hang_man => @update
    assert_redirected_to player_url
  end
  
  test "should destroy hang_man std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('HangMan.count', 0) do
      delete :destroy, :id => @hang_man.to_param
    end
    assert_redirected_to player_url
  end
end
