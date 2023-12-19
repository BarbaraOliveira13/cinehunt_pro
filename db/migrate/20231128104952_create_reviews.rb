class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :scene, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.float :rating

      t.timestamps
    end
  end
end
