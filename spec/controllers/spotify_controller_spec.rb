require 'rails_helper'

RSpec.describe SpotifyController, type: :controller do

  describe "GET #user" do
    it "returns http success" do
      get :user
      expect(response).to have_http_status(:success)
    end
  end

end
