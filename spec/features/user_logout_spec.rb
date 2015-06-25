require 'rails_helper'

RSpec.describe "authorized user can login", type: :feature do 
  it "can logout" do 
    @user = create(:user)
    visit '/'
    within '.navbar' do
      select 'with Email', from: 'Login'
    end


    fill_in("session[email]", with: "bubba@example.com" )
    fill_in("session[password]", with: "password" )
    click_button 'Login'

    within '.navbar' do
      select 'Logout', from: "Hello #{@user.username}!"
    end

    expect(page).to have_content("Successfully logged out!")
    expect(page).not_to have_content("Welcome #{@user.username}!")
    expect(current_path).to eql(root_path)
  end
end

