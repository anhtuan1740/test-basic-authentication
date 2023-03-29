require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest

  def before_run_test
    user1 =  User.find_by(email: "test@test.com")
    user2 =  User.find_by(email: "test5@test.com")
    youtube1 = YoutubeVideo.all[0]
    youtube2 = YoutubeVideo.all[1]
    youtube3 = YoutubeVideo.all[2]

    youtube1.user = user1
    youtube1.save!

    youtube2.user = user2
    youtube2.save!

    youtube3.user = user2
    youtube3.save!
  end

  test "should get index" do
    before_run_test
    get "/"
    assert(@response.response_code, 200)
  end

end
