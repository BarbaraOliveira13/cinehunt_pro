class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorite_lists, dependent: :destroy
  has_many :favorites, through: :favorite_lists
  validates :username, presence: true, uniqueness: true
  has_many :reviews
  has_many :scenes

  def certified?
    self.certification
  end

  def favorite_scenes
    favorite_scene_ids = self.favorites.map { |favorite| favorite.scene_id }
    Scene.where(id: favorite_scene_ids)
  end

  def is_a_jedi_master?
    self.level == 100
    self.certification = true
  end
end
