require 'test_helper'

class UpdatetablesControllerTest < ActionController::TestCase
  test "should get update std" do
    session.delete :user_id
    session[:user_id] = users(:three).id
    get :update
    assert_redirected_to player_url
  end

end
