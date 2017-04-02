class Photo < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  acts_as_votable
end
