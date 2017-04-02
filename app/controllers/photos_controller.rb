class PhotosController < ApplicationController
	before_action :authenticate_user!, only: [:upvote]

	def upvote
		# unless user_signed_in?
		# 	redirect_to '/users/sign_in'
		# end
		@photo = Photo.find(params[:id])
			if !current_user.liked? @photo
				@photo.liked_by current_user
			elsif current_user.liked? @photo
				@photo.unliked_by current_user
			end
	  		redirect_to :back
	end
end
