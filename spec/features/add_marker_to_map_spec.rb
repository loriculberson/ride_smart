require 'rails_helper'

RSpec.describe "map canvas", type: :feature do

  def login
    @user = create(:user)
    visit '/'
    click_on 'Login'
    click_on 'with Email'
  end

  def fill_in_login
    fill_in("session[email]", with: "bob@example.com" )
    fill_in("session[password]", with: "password" )
    click_button 'Login'
  end

  it "is visible to all users" do
    login
    fill_in_login
    visit ('/bike_events')

    expect(page).to have_css('div#map-canvas')
  end
end

