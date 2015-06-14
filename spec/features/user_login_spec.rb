require 'rails_helper'

RSpec.describe "authorized user can login", type: :feature do 

  it "can login" do
    user = create(:user)
    visit '/'
    within('#login') do
      fill_in("session[username]", with: "bubba" )
      fill_in("session[password]", with: "password" )
      click_on 'Login'
    end 
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome #{user.username}!")
    expect(current_path).to eql(root_path)
  end

  it "can not login without a valid password" do
    user = create(:user)
    visit '/'
    within('#login') do
      fill_in("session[username]", with: "bubba" )
      fill_in("session[password]", with: "" )
      click_on 'Login'
    end 
    expect(page).to have_content("Invalid login. Please try again.")
    expect(current_path).to eql(root_path)
  end  
end