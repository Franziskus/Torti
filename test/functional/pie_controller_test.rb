require 'test_helper'

class PieControllerTest < ActionController::TestCase
  test "should get genPie" do
    get :genPie
    assert_response :success
  end

end
