class AddAdressToPlace < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :address, :string
  end
end
