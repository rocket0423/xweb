require 'test_helper'

class UpdatetablesControllerTest < ActionController::TestCase
  test "admin get update should redirect to player" do
    get :update
    assert_redirected_to player_path
  end

end
