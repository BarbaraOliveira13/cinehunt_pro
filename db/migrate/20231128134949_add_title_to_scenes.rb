class AddTitleToScenes < ActiveRecord::Migration[7.1]
  def change
    add_column :scenes, :title, :string
  end
end
