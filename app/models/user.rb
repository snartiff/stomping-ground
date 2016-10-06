class User < ActiveRecord::Base
  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  has_many :districts
  has_many :reviews
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { minimum: 4,
       maximum: 16 }
end
