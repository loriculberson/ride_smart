require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  context 'user hits nonexistent url' do

    it "returns not_found template" do
      get :not_found

      expect(response).to render_template :not_found
    end
  end

  context 'user hits internal server error' do

    it "returns internal server error template" do
      get :internal_server_error

      expect(response).to render_template :internal_server_error
    end
  end
end