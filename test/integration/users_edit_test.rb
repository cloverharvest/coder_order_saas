require 'test_helper'

class UsersEditTestTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anna)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              password: "fizz",
                                              password_confirmation: "buzz" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Fizz Buzz"
    email = "fizz@buzz.com"
    patch user_path(@user), params: { user: { name: name,
                                        email: email,
                                        password: "",
                                        password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
