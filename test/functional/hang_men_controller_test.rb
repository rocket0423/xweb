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
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hang_men)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create hang_man" do
    assert_difference('HangMan.count') do
      post :create, :hang_man => @update
    end
    
    assert_redirected_to hang_man_path(assigns(:hang_man))
  end
  
  test "should show hang_man" do
    get :show, :id => @hang_man.to_param
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => @hang_man.to_param
    assert_response :success
  end
  
  test "should update hang_man" do
    put :update, :id => @hang_man.to_param, :hang_man => @update
    assert_redirected_to hang_man_path(assigns(:hang_man))
  end
  
  test "should destroy hang_man" do
    assert_difference('HangMan.count', -1) do
      delete :destroy, :id => @hang_man.to_param
    end
    
    assert_redirected_to hang_men_path
  end
end
