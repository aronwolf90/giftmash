require 'rails_helper'

RSpec.describe "/upvotes", type: :request do
  describe "GeT /upvotes/new" do
    before { create(:gift) }

    it "renders successfully" do
      get new_upvote_path

      expect(response).to be_successful
    end
  end

  describe "POST /upvotes" do
    let(:gift) { create(:gift) }

    it "redirects to new_upvote path" do
      post upvotes_path, params: { id: gift.id }

      expect(response).to redirect_to(new_upvote_path)
    end

    it "show flash message" do
      post upvotes_path, params: { id: gift.id }
      expect(flash[:notice]).to be_present    end

    it "increment rating by 1" do
      expect do
        post upvotes_path, params: { id: gift.id }
      end.to change { gift.reload.rating }.by(1)
    end
  end
end
