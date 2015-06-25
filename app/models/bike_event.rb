class BikeEvent < ActiveRecord::Base
  validates :event_kind, :occurred_at, :details, :user_id, :latitude, :longitude, presence: true
  validate :valid_date
  belongs_to :user

  def valid_date
    if occurred_at.future?
      errors.add(:occurred_at, "Event can not be in the future")
    end
  end

  def date
    occurred_at.strftime('%m-%d-%y')
  end

  def time
    occurred_at.strftime('%I:%M %P')
  end

  def self.filter_by(type)
    if type.nil?
      all
    else
      where(event_kind: type)
    end
  end

  def pin_color
    case event_kind
      when 'Accident'
      "accident"  #key for icon in js land
      when 'Road Hazard'
      "hazard"  
      when 'Freak, animal incident'
      "animal" 
    else
      "other"
    end
  end

end

