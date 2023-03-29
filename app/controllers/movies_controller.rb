require 'video_info'

class MoviesController < ApplicationController
  def index
    @videos = []
    YoutubeVideo.all.each do |youtube_video|
      link = youtube_video.link
      video = VideoInfo.new(link)
      @videos << { title: video.title, embed_url: video.embed_url, description: video.description, shared_by: youtube_video.user.email }
    end
  end
end
