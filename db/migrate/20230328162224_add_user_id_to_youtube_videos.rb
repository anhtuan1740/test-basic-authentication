class AddUserIdToYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    add_column(:youtube_videos, :user_id, :integer, index: true)
  end
end
