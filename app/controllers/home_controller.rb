class HomeController < ApplicationController
  def index
    @photos = Photo.all
  end


  def uploaded
    # uploader = AvatarUploader.new
    # uploader.store!(params[:my_image])
    uploader_one = AvatarUploader.new
    uploader_one.store!(params[:first_image])

    uploader_two = AvatarUploader.new
    uploader_two.store!(params[:second_image])

    # render :text => uploader.url # store this usrl to database
    u = Photo.new
    u.background_img = uploader_one
    u.face_img = uploader_two
    # u.avatar = uploader

    u.save!
    u.avatar.url # => '/url/to/file.png'
    u.avatar.current_path # => 'path/to/file.png'
    u.avatar_identifier # => 'file.png'

    redirect_to "/home/hollywood"
  end

  def hollywood
    @photos = Photo.all
  end

  def createform
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
      @photos = Photo.all
    # unless user_signed_in?
    #   redirect_to "users/sign_in"
    # end
  end

end
