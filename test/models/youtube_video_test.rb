require 'test_helper'

class YoutubeVideoTest < ActiveSupport::TestCase
  test "Number of youtube video" do
    user = User.find_by(email: "test@test.com")
    assert(YoutubeVideo.all.length == 3)
  end

  test "All scenario of videos" do
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

    assert(YoutubeVideo.where(user: user1).length == 1)
    assert(YoutubeVideo.where(user: user2).length == 2)

    youtube4 = YoutubeVideo.new(link: "https://www.youtube.com/watch?v=-HbQBowPi7o", user: user1)
    assert_raise(ActiveRecord::RecordNotUnique) {youtube4.save!}

    youtube5 = YoutubeVideo.new(link: "https://www.youtube.com/watch?v=XgPJ8g05qOw", user: user1)
    assert(youtube5.new_record?)
    youtube5.save!
    assert(!youtube5.new_record?)
  end
end
