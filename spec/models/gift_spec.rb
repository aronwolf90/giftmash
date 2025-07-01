require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe ".import_form_csv" do
    let(:csv) do
      file = Tempfile.new('csv')

      file.write(
        <<~EOS
        name; image_url; url
        Test name; http://example.com/image.png; http://example.com
        EOS
      )

      file.close
      file
    end

    after { csv.unlink }

    it "imports gifts from csv" do
      expect { described_class.import_from_csv(csv.path) }.to change(described_class, :count).by(1)

      expect(Gift.last).to have_attributes(
        name: "Test name",
        image_url: "http://example.com/image.png",
        url: "http://example.com"
      )
    end
  end

  describe ".ordered" do
    let!(:worst_rated_gift) { create(:gift, rating: 0) }
    let!(:best_rated_gift) { create(:gift, rating: 2) }

    it "return gifts ordered by rating" do
      expect(described_class.ordered).to eq [ best_rated_gift, worst_rated_gift ]
    end
  end

  describe "#upvote" do
    let!(:gift) { create(:gift, rating: 0) }

    it "increments ratings counter" do
      gift.upvote

      expect(gift.rating).to eq 1
    end
  end
end
