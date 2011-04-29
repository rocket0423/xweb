require 'test_helper'

class UpdatetablesControllerTest < ActionController::TestCase
  test "logot get update should redirect to login" do
    session.delete :user_id
    get :update
    assert_redirected_to login_url
  end

end
