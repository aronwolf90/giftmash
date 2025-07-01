require "rails_helper"

RSpec.feature "Upvote gift", type: :feature do
  let!(:gift) { create(:gift) }

  scenario "Click on gift increases rating" do
    visit new_upvote_path

    expect do
      click_button gift.name
    end.to change { gift.reload.rating }.by(1)

    expect(page).to have_content "Successfully voted for \"#{gift.name}\""
  end
end
