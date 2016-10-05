class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :district

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :user_id, presence: true
  validates :district_id, presence: true
  validates :tags, length: { in: 3..15 }
end
