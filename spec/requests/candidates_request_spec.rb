require 'rails_helper'

RSpec.describe "Candidates", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/candidates/new"
      expect(response).to have_http_status(:success)
    end
  end

end
