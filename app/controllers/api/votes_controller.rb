class Api::VotesController < ApiController
  # def create
  #   @review = Review.find(params[:id])
  #   @votes = @review.votes
  #   if @votes.exists?(:user => current_user)
  #     @vote = @votes.where(:user => current_user)[0]
  #     if !@vote.vote
  #       @vote.update_attribute(:vote, true)
  #     else
  #       Vote.destroy(@vote)
  #     end
  #   else
  #     @review.votes.create(:user_id => current_user.id, :review_id => @review.id, :vote => true)
  #   end
  #
  #   @upvotes = @review.votes.where(vote: :true)
  #   @downvotes = @review.votes.where(vote: :false)
  #
  #   respond_to do |format|
  #     format.json do
  #       render json: { upvotes: @upvotes.count, downvotes: @downvotes.count }
  #     end
  #   end
  #
  # end

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

    @upvotes = @review.votes.where(vote: :true)
    @downvotes = @review.votes.where(vote: :false)

    respond_to do |format|
      format.json do
        render json: { upvotes: @upvotes.count, downvotes: @downvotes.count }
      end
    end

    # <% up_votes = r.votes.where(:vote => true) %>
    # <div id="upvote"><%= up_votes.count %></div> Upvotes
    # <% down_votes = r.votes.where(:vote => false) %>
    # <%= down_votes.count %> Downvotes
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

    @upvotes = @review.votes.where(vote: :true)
    @downvotes = @review.votes.where(vote: :false)

    respond_to do |format|
      format.json do
        render json: { upvotes: @upvotes.count, downvotes: @downvotes.count }
      end
    end
  end

end
