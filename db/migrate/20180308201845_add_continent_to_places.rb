class AddContinentToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :continent, :string
  end
end
