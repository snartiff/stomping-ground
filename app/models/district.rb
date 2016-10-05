class District < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
