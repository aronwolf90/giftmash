class UpvotesController < ApplicationController
  def new
    @gifts = Gift.random.limit(2)
  end

  def create
    gift = Gift.find(params.require(:id))

    gift.upvote

    redirect_to new_upvote_path, notice: "Successfully voted for \"#{gift.name}\""
  end
end
