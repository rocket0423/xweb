require 'test_helper'

class HangMenControllerTest < ActionController::TestCase
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
  
  test "logout create hang man should redirect to login no create" do
    session.delete :user_id
    assert_difference('HangMan.count',0) do
      post :create, :hang_man => @update
    end
    assert_redirected_to login_url
  end
  
  test "logout get show should redirect to login" do
    session.delete :user_id
    get :show, :id => @hang_man.to_param
    assert_redirected_to login_url
  end
  
  test "logout get edit should redirect to login" do
    session.delete :user_id
    get :edit, :id => @hang_man.to_param
    assert_redirected_to login_url
  end
  
  test "logout put update should redirect to login" do
    session.delete :user_id
    put :update, :id => @hang_man.to_param, :hang_man => @update
    assert_redirected_to login_url
  end
  
  test "logout destroy hang man should redirect to login with same count" do
    session.delete :user_id
    assert_difference('HangMan.count', 0) do
      delete :destroy, :id => @hang_man.to_param
    end
    assert_redirected_to login_url
  end
end
