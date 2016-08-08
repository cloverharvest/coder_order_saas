require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    assert_raises(NameError) do
      get pages_home_url
      assert_raises :success
      assert_select "title", "Order of Coders"
    end
  end

  test "should get about" do
    assert_raises(NameError) do
      get pages_about_url
      assert_raises :success
      assert_select "title", "About Us"
    end
  end
end
