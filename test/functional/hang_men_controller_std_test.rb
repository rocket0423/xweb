require 'test_helper'

class HangMenControllerTest < ActionController::TestCase
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
  
  test "std create hang man should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('HangMan.count',0) do
      post :create, :hang_man => @update
    end
    assert_redirected_to player_url
  end
  
  test "std get show should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :show, :id => @hang_man.to_param
    assert_redirected_to player_url
  end
  
  test "std get edit should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :edit, :id => @hang_man.to_param
    assert_redirected_to player_url
  end
  
  test "std update hang man should redirect to player" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    put :update, :id => @hang_man.to_param, :hang_man => @update
    assert_redirected_to player_url
  end
  
  test "std destroy hang man should redirect to player same count" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    assert_difference('HangMan.count', 0) do
      delete :destroy, :id => @hang_man.to_param
    end
    assert_redirected_to player_url
  end
end
