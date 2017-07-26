require 'rails_helper'

RSpec.describe "authorized user can login", type: :feature do 

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

  it "can login" do
    login
    fill_in_login

    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Hello #{@user.username}!")
    expect(current_path).to eql(bike_events_path)
  end

  it "can not login without a valid password" do
    login

    fill_in("session[email]", with: "bob@example.com" )
    fill_in("session[password]", with: "" )
    click_button 'Login'

    expect(page).to have_content("Invalid login. Please try again.")
    expect(current_path).to eql(login_path)
  end  

  it "can logout" do 
    login
    fill_in_login
    click_on "Logout"

    expect(page).to have_content("Successfully logged out!")
  end

  it "can log in with Google" do 
    visit '/'
    expect(page).not_to have_content("Hello google_mock_user!")
    
    click_on 'Login'
    mock_omniauth_user
    click_on 'with Google'

    expect(page).to have_content("Hello google_mock_user!")
  end

  describe "user created account with email exisits in database" do 
    context "logs in with Google" do
      it "finds the user by email" do 

        User.create!(
          email: 'bob@example.com',
          username: 'any_username',
          password: 'password',
          provider: nil,
          uid: nil
        )

        mock_omniauth_user("bob@example.com")
        visit '/'
        click_on 'Login'
        click_on 'with Google'

        expect(current_path).to eql(root_path)
      end
    end
  end
end
