require 'rails_helper'

RSpec.describe type: :feature do

  def sign_up
    visit '/'
    click_on 'Sign Up'
  end

  describe "Email and password account creation" do 
    it "can  login without OAuth" do
      sign_up
      click_on 'Create account with Email'
      expect(current_path).to eq(new_user_path)
    end

    it "displays flash message if user is created" do
      sign_up
      click_on 'Create account with Email'
      fill_in("user[username]", with: "buttercup" )
      fill_in("user[password]", with: "password" )
      fill_in("user[password_confirmation]", with: "password" )
      fill_in("user[email]", with: "happy@example.com" )
      fill_in("user[nickname]", with: "twitter rockstar" )
      click_on "Create Account"

      expect(page).to have_content("Account Created!")
    end

    context "displays an error message" do 
      it "if user does not include email" do 
        sign_up
        click_on 'Create account with Email'
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

    context "username" do 
      it "does not have to be unique" do 

        User.create(
          email: 'unique@example.com',
          username: 'same username',
          password: 'password'
        )

        sign_up
        click_on 'Create account with Email'
        fill_in("user[username]", with: 'same username' )
        fill_in("user[password]", with: "password" )
        fill_in("user[password_confirmation]", with: "password" )
        fill_in("user[email]", with: 'cool_dude@example.com' )
        click_on "Create Account"

        expect(page).to have_content("Account Created!")
      end
    end
  end
end