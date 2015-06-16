class CreateBikeEvents < ActiveRecord::Migration
  def change
    create_table :bike_events do |t|
      t.string :event_kind
      t.datetime :occurred_at
      t.string :details
      t.decimal :latitude, :precision=>10, :scale=>6
      t.decimal :longitude, :precision=>10, :scale=>6
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
