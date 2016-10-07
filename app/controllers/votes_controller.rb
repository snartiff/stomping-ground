class VotesController < ApplicationController

  def vote_up
    @review = Review.find(params[:id])
    @votes = @review.votes
    if @votes.exists?(:user => current_user)
      @vote = @votes.where(:user => current_user)[0]
      if !@vote.vote
        @vote.update_attribute(:vote, true)
      else
        Vote.destroy(@vote)
      end
    else
      @review.votes.create(:user_id => current_user.id, :review_id => @review.id, :vote => true)
    end

  end

  def vote_down
    @review = Review.find(params[:id])
    @votes = @review.votes
    if @votes.exists?(:user => current_user)
      @vote = @votes.where(:user => current_user)[0]
      if @vote.vote
        @vote.update_attribute(:vote, false)
      else
        Vote.destroy(@vote)
      end
    else
      @review.votes.create(:user_id => current_user.id, :review_id => @review.id, :vote => false)
    end
  end

end
