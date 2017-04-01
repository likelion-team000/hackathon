class HomeController < ApplicationController
  def index
  end


  def uploaded
    uploader = AvatarUploader.new
    uploader.store!(params[:my_image])
    redirect_to "/home/index"
  end
end
