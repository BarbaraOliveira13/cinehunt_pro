class FavoriteList < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :favorites, dependent: :destroy
end
