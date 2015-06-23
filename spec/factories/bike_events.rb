FactoryGirl.define do

  before do
    :user
    :user2
  end

  factory :bike_event1 do
    user
    event_kind "Accident"
    occurred_at "Mon, 22 Jun 2015 02:59:00 UTC +00:00"
    details "Some details"
    user_id user.id
    latitude '39.792050535946956'
    longitude '-104.92372512817383'
  end
  
  factory :bike_event2 do
    user2
    event_kind "Road Hazard"
    occurred_at "Sun, 21 Jun 2015 02:59:00 UTC +00:00"
    details "Some more details"
    user_id user2.id
    latitude '39.749965'
    longitude '-105.000036'
  end
  

end