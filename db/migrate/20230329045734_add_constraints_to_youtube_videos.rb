class AddConstraintsToYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    add_index :youtube_videos, :link, unique: true
  end
end
