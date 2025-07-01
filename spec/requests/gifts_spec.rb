require 'rails_helper'

RSpec.describe "/gifts", type: :request do
  describe "GET /index" do
    let!(:gift_worst_score) { create(:gift, rating: 0) }
    let!(:gift_best_score) { create(:gift, rating: 4) }

    it "renders gifts in correct order" do
      get gifts_url
      expect(response).to be_successful
      expect(response.body).to match(/#{gift_best_score.name}.*#{gift_worst_score.name}/m)
    end
  end
end
