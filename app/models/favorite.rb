class Favorite < ApplicationRecord
  belongs_to :favorite_list
  belongs_to :scene
end
