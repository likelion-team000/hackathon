require 'test_helper'

class GalleryControllerTest < ActionController::TestCase
  test "should get hollywood" do
    get :hollywood
    assert_response :success
  end

end
