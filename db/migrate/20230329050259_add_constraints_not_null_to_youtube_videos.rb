class AddConstraintsNotNullToYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    change_column_null :youtube_videos, :link, false
  end
end
