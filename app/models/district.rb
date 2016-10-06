class District < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :reviews
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
