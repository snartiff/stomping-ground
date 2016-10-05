class User < ActiveRecord::Base
  has_many :districts
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { minimum: 4,
       maximum: 16 }
end
