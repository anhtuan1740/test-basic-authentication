require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post sessions_create_url, {:params => {email: "test7@test.com", password: "123"}}
    assert(@response.response_code, 302)
  end
end
