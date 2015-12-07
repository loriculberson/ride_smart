require 'rails_helper'

RSpec.describe BikeEvent, type: :model do

  it "is valid with all attributes" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).to be_valid
  end  

  it "is not valid without an event kind" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: nil, occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid without a date" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: nil,
                                  details: "Some details", user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid with a future date" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2030 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: nil, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid without details" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: nil, user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid without a user id" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: nil, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid without a latitude" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: nil, latitude: nil, 
                                  longitude: '-104.92372512817383' )
    expect(bike_event).not_to be_valid
  end 

  it "is not valid without a longitude" do
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: nil, latitude: '39.792050535946956', 
                                  longitude: nil )
    expect(bike_event).not_to be_valid
  end 

  it "shows a date" do 
    user = create(:user)

    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event.date).to eq("06-22-15")
  end

  it "shows a time" do 
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39.792050535946956', 
                                  longitude: '-104.92372512817383' )
    expect(bike_event.time).to eq("02:59 am")

  end

  it "can filter by event kind" do 
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39', 
                                  longitude: '-104' )
    

    expect(BikeEvent.filter_by("Accident").first.event_kind).to eq(bike_event.event_kind)
  end

  it "knows its pin color" do 
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Accident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39', 
                                  longitude: '-104' )

    expect(bike_event.pin_color).to eq("accident")

  end

  it "knows its pin color" do 
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Road Hazard", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39', 
                                  longitude: '-104' )

    expect(bike_event.pin_color).to eq("hazard")

  end

  it "knows its pin color" do 
    user = create(:user)
    bike_event = BikeEvent.create(event_kind: "Freak, wildlife incident", occurred_at: "Mon, 22 Jun 2015 02:59:00 UTC +00:00",
                                  details: "Some details", user_id: user.id, latitude: '39', 
                                  longitude: '-104' )

    expect(bike_event.pin_color).to eq("animal")

  end

 
end

  
  
