require 'rails_helper'

RSpec.describe BikeEventsController, type: :controller do

  before(:each) do
    @bike_event1 = create(:bike_event1)
    @bike_event2 = create(:bike_event2)
  end

  it "can only delete pins created by the user who created it" do
    
    expect(page).to have_content("Remove marker")
  end
end
