require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Number of user" do
    assert(User.all.length == 2)
  end

  test "Authenticate user 1" do
    user = User.find_by(email: "test@test.com")
    puts user.id
    assert(user.present?)
    assert(user.authenticate("P@ssw0rd123"))
  end

  test "Authenticate user 2" do
    user = User.find_by(email: "test5@test.com")
    assert(user.present?)
    assert(user.authenticate("123"))
  end

  test "Insert duplicate email user" do
    user = User.new(email: "test@test.com", password: "123")
    assert_raise(ActiveRecord::RecordInvalid) {user.save!}
  end

  test "Insert good email" do
    user = User.new(email: "test2@test.com", password: "123")
    user.save!
    assert(!user.new_record?)
  end

end
