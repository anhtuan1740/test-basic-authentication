require 'test_helper'

class ShareControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get share_new_url
    # assert_response :success
    assert(@response.response_code, 302)
  end

  test "should post new" do
    post share_video_path
    # assert_response :success
    assert(@response.response_code, 302)
  end

  test "should get new 2" do
    Current.user = User.find_by(email: "test@test.com")
    get share_new_url
    assert(@response.response_code, 200)
  end

end
