require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:password].any?
  end
  
  test "User is not valid without a unique name - i18n" do
    user = User.new(:name             => users(:one).name,
                    :hashed_password  => "<%= User.encrypt_password('secret', SALT) %>",
                    :salt             => "<%= SALT %>")
    assert !user.save
    assert_equal "has already been taken", user.errors[:name].join('; ')
  end
  
end