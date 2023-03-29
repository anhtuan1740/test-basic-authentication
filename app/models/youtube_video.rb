class YoutubeVideo < ApplicationRecord
  belongs_to :user, optional: false
end
