require 'rails_helper'

RSpec.describe "MyMemories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/my_memories/index"
      expect(response).to have_http_status(:success)
    end
  end

end
