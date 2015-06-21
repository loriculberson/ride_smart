class BikeEvent < ActiveRecord::Base
  validates :event_kind, :occurred_at, :details, :user_id, :latitude, :longitude, presence: true
  validate :valid_date
  belongs_to :user

  def valid_date
    if occurred_at < Date.today
    end
  end

  def date
    occurred_at.strftime('%m-%d-%y')
  end

  def time
    occurred_at.strftime('%I:%M %P')
  end

end

