class AddFutureToUserPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :user_places, :future, :boolean, default: false
  end
end
