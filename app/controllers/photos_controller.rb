class PhotosController < ApplicationController
	before_action :authenticate_user!, only: [:upvote]

	def upvote
		@photo = Photo.find(params[:id])
		if !current_user.liked? @photo
			@photo.liked_by current_user
		elsif current_user.liked? @photo
			@photo.unliked_by current_user
		end
  		redirect_to :back
	end

end
