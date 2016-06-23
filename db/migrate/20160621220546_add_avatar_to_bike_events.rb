class AddAvatarToBikeEvents < ActiveRecord::Migration
  def change
    add_column :bike_events, :avatar, :string
  end
end
