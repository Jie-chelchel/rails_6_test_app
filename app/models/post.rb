class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 6..50}
  validates :description, presence: true, length: { in: 10..300}
  
end