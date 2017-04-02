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
    u.location = params[:location]
    u.content = params[:content]
    if current_user.name != nil
      u.user_name = current_user.name
    else
        u.user_name = current_user.email
    end

    if current_user.image != nil
      u.user_img_url = current_user.image
    else
      u.user_img_url = 'https://s3-us-west-1.amazonaws.com/hackthon-likelion/asset/noprofile.jpg'
    end
    # u.avatar = uploader

    u.save!
    u.avatar.url # => '/url/to/file.png'
    u.avatar.current_path # => 'path/to/file.png'
    u.avatar_identifier # => 'file.png'

    #output = `python hackathon/lib/swapface.py u.background_img u.face_img`
    #logger.info "#####################################"
    #puts output
    #logger.info "#####################################"

    ## open python script to load images from 2 different url and merge two faces to one image
    require 'open3'

    uploader_three = AvatarUploader.new
    output = "python #{Rails.root.join('lib', 'swapface.py')} #{u.background_img} #{u.face_img} #{Rails.root.join('lib', 'shape_predictor_68_face_landmarks.dat')}"
    Open3.popen3(output) do |stdin, stdout, stderr, wait_thr|
      logger.info "stdout is:" + stdout.read
      logger.info "stderr is:" + stderr.read

      #Upload Here
      file_path = Rails.root.join('output1.jpg')
      uploader_three.store!(File.open(file_path))
      logger.info "######################MERGED_FILE##################"
      logger.info uploader_three.url
      logger.info "######################MERGED_FILE##################"
      File.delete(file_path)

    end

    u.background_img = "https://hackthon-likelion.s3.amazonaws.com/uploads/956470095761851/output#{u.id}.jpg"
    u.save!

    redirect_to "/#image-test"
  end

  def hollywood
     @photos = Photo.select{|item| item[:location] == "hollywood"}
  end

  def dodger
     @photos = Photo.select{|item| item[:location] == "dodger"}
  end

  def getty
     @photos = Photo.select{|item| item[:location] == "getty"}
  end

  def lacma
     @photos = Photo.select{|item| item[:location] == "lacma"}
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
