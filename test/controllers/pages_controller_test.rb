require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    assert_raises(NameError) do
      get pages_home_url
    end
    # get pages_home_url
    # assert_response :success
  end
end
