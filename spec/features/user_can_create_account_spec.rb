require 'rails_helper'

RSpec.describe type: :feature do

  def sign_up
    visit '/'
    click_on 'Sign Up'
  end

  it "can create an account without OAuth" do
    sign_up

    expect(current_path).to eq(new_user_path)
  end

  it "sees successful flash message if user is created" do
    sign_up
    fill_in("user[username]", with: "buttercup" )
    fill_in("user[password]", with: "password" )
    fill_in("user[password_confirmation]", with: "password" )
    fill_in("user[email]", with: "happy@example.com" )
    fill_in("user[nickname]", with: "twitter rockstar" )
    click_on "Create Account"

    expect(page).to have_content("Account Created!")
  end

  it "sees an error message if user does not include email" do 
    sign_up
    fill_in("user[username]", with: "buttercup" )
    fill_in("user[password]", with: "password" )
    fill_in("user[password_confirmation]", with: "password" )
    fill_in("user[email]", with: nil )
    fill_in("user[nickname]", with: "twitter rockstar" )
    click_on "Create Account"

    expect(page).to have_content("Email can't be blank")
    expect(current_path).to eq(users_path)
  end
end