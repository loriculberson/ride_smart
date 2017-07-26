require 'rails_helper'

RSpec.describe "Error pages", type: :feature do

  describe "404 page" do
    it "is customized" do
      visit "/404"

      expect(page.status_code).to eq 404
      expect(page).to have_content("Something went wrong.")
    end
  end

  describe "500 page" do
    it "is customized" do
      visit "/500"

      expect(page.status_code).to eq 500
      expect(page).to have_content("Something went really wrong.")
    end
  end
end