require 'rails_helper'

RSpec.describe "DayHows", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/day_hows/new"
      expect(response).to have_http_status(:success)
    end
  end

end
