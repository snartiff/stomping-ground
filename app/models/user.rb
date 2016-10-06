class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :districts
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { minimum: 4,
       maximum: 16 }

  def admin?
    role == 'admin'
  end
end
