require 'test_helper'

class TextMessagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get send_message" do
    get :send_message
    assert_response :success
  end

end
