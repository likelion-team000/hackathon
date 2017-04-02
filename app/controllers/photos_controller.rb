class PhotosController < ApplicationController
	def upvote
		@photo = Photo.find(params[:id])
		@photo.upvote_by current_user
  		redirect_to :back
	end

end
