class BikeEvent < ActiveRecord::Base
  validates :event_kind, :occurred_at, :details, :user_id, :latitude, :longitude, presence: true

  belongs_to :user
end
