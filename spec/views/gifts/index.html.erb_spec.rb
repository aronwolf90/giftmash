require 'rails_helper'

RSpec.describe "gifts/index", type: :view do
  context "when there are gifts" do
    let(:gift) { build(:gift) }

    before { assign :gifts, [ gift ] }

    it "renders gifts" do
      render
      have_content gift.name
    end
  end

  context "when there is no gift" do
    before { assign :gifts, [] }

    it "renders no gifts text" do
      render
      have_content "No gifts found. Pleas run bin/rails db:seed."
    end
  end
end
