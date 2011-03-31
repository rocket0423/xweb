require 'test_helper'

class UpdatetablesControllerTest < ActionController::TestCase
  test "should get update admin" do
    get :update
    assert_redirected_to player_path
  end

end
