class ShareController < ApplicationController
  def new
    if Current.user.blank?
      redirect_to root_path
    end
  end

  def create
    begin
      VideoInfo.new(params[:link])
    rescue Exception => e
      puts e.class
      flash[:alert_link] = {alert: e.message, link: params[:link]}
      redirect_to share_new_path
      return
    end

    youtubeVideo = YoutubeVideo.new(user: Current.user, link: params[:link])
    begin
      youtubeVideo.save!
      redirect_to root_path
    rescue Exception => e
      flash[:alert_link] = {alert: e.message, link: params[:link]}
      redirect_to share_new_path
    end
  end
end
