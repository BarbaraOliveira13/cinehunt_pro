class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :lat
      t.string :long
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
