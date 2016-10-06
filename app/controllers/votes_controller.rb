class VotesController < ApplicationController

  def vote_up
    @review = Review.find(params[:id])
    @vote = @review.votes.create(:user_id => current_user.id, :review_id => @review.id, :vote => true)
  end

  def vote_down
    @review = Review.find(params[:id])
    @vote = @review.votes.create(:user_id => current_user.id, :review_id => @review.id, :vote => false)
  end

end
