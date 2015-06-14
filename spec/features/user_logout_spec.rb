require 'rails_helper'

RSpec.describe "authorized user can login", type: :feature do 
  it "can logout" do 
    user = create(:user)
    visit '/'
    within('#login') do
      fill_in("session[username]", with: "bubba" )
      fill_in("session[password]", with: "password" )
      click_on 'Login'
    end 
    click_on 'Logout'
    expect(page).to have_content("Successfully logged out!")
    expect(page).not_to have_content("Welcome #{user.username}!")
    expect(current_path).to eql(root_path)
  end
end