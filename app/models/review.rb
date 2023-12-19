class Review < ApplicationRecord
  belongs_to :scene
  belongs_to :user
  validates :rating, presence: true
  validates :content, presence: true
end
