require 'test_helper'

class UpdatetablesControllerTest < ActionController::TestCase
  test "should get update logout" do
    session.delete :user_id
    get :update
    assert_redirected_to login_url
  end

end
