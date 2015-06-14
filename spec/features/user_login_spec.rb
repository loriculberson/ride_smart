require 'rails_helper'

RSpec.describe type: :feature do

  it "can create and account" do
    visit '/'
    click 'Sign Up'

    expect(current_path).to eq(new_user_path)
  end
end