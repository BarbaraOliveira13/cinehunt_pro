class Movie < ApplicationRecord

  validates :title, presence: true
  validates :category, presence: true
  has_many :scenes
  has_many :places
end
