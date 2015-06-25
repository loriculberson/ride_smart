require 'rails_helper'

RSpec.describe User, type: :model do
  attr_reader :user

  it "is valid when it has a username, password and email" do
    @user = create(:user)
    expect(user).to be_valid
  end  

  it "is not valid when username is nil" do
    user = User.create(username: nil, password: "password", email: "bubba@example.com")

    expect(user).not_to be_valid
  end

  it "is not valid when password is nil" do
    user = User.create(username: "bubbaGump", password: nil, email: "bubba@example.com")

    expect(user).not_to be_valid
  end

  it "is not valid when email is nil" do
    user = User.create(username: "bubbaGump", password: 'password', email: nil)

    expect(user).not_to be_valid
  end


  it "is not valid when duplicate username is trying to be created" do
    user = create(:user)
    user2 = User.create(username: 'bubba', password: "password", email: "big_bubba@example.com")

    expect(user2).not_to be_valid
  end

  it "is not valid when duplicate email is trying to be created" do
    user = User.create(username: 'cyndi', password: "password", email: "big_bubba@example.com")
    user2 = User.create(username: 'bubba', password: "password", email: "big_bubba@example.com")

    expect(user2).not_to be_valid
  end
  
end
