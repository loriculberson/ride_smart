user = User.create_with(pasword: "password").find_or_create_by!(username: "Lori", email: "lori@example.com")

BikeEvent.create!( event_kind: "accident" , occurred_at: "2015-02-13", details: "Car ran red light", 
                  latitude:  39.749729, longitude: -104.99998, user_id: user.id ) 

BikeEvent.create!( event_kind: "other" , occurred_at: "2015-02-17", details: "flat tire due to glass on road", 
                  latitude:  39.736328, longitude: -104.9732883, user_id: user.id )

BikeEvent.create!( event_kind: "road hazard" , occurred_at: "2015-02-22", details: "Hit a pothole", 
                  latitude:  39.7345039, longitude: -104.966085, user_id: user.id )
