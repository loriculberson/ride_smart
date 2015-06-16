require 'rails_helper'

RSpec.describe "authorized user can login", type: :feature do 

  def login
    @user = create(:user)
    visit '/'
    click_on 'Login'
    click_on 'with Email'
  end

  it "can login" do
    login
    
    fill_in("session[email]", with: "bob@example.com" )
    fill_in("session[password]", with: "password" )
    click_button 'Login'

    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Hello #{@user.username}!")
    expect(current_path).to eql(root_path)
  end

  it "can not login without a valid password" do
    login

    fill_in("session[email]", with: "bob@example.com" )
    fill_in("session[password]", with: "" )
    click_button 'Login'

    expect(page).to have_content("Invalid login. Please try again.")
    expect(current_path).to eql(login_path)
  end  
end