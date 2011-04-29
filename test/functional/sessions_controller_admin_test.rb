require 'test_helper'

class SessionsControllerTest < ActionController::TestCase  
  test "admin get new should redirect to player" do
    get :new
    assert_redirected_to player_url
  end
  
  test "admin login should redirect to player session stays same" do
    dave = users(:two)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to player_url
    assert_not_equal dave.id, session[:user_id]
  end
  
  test "admin should logout then redirect to login" do
    delete :destroy
    assert_redirected_to login_url
  end
  
end
