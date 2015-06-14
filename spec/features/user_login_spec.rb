require 'rails_helper'

RSpec.describe type: :feature do

  it "can create and account" do
    visit '/'
    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
  end

  it "sees successful flash message if user is created" do
    visit new_user_path
    fill_in("user[username]", with: "buttercup" )
    fill_in("user[password]", with: "password" )
    fill_in("user[password_confirmation]", with: "password" )
    fill_in("user[email]", with: "happy@example.com" )
    fill_in("user[nickname]", with: "twitter rockstar" )
    click_link_or_button "Create Account"

    expect(page).to have_content("Account created!")

  end

  
end