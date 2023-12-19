class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :favorite_list, null: false, foreign_key: true
      t.references :scene, null: false, foreign_key: true

      t.timestamps
    end
  end
end
