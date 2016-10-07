class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def edit
    review = Review.find(params[:id])
    if signed_in? && (current_user == review.user || current_user.admin)
      @district = District.find(params[:district_id])
      @review = Review.find(params[:id])
    elsif !signed_in?
      authenticate_user!
    else
      flash[:alert] = 'You have to sign in first!'
      redirect_to district_path(@district)
    end
  end

  def update
    @review = Review.find(params[:id])
    @district = District.find(params[:district_id])
    if signed_in? && (current_user == @review.user || current_user.admin)
      if @review.update_attributes(review_params)
        flash[:notice] = 'Review successfully updated.'
        redirect_to district_path(@district)
      elsif !signed_in?
        authenticate_user!
      else
        flash[:error] = @review.errors.full_messages.join(", ")
        render :edit
      end
    else
      flash[:alert] = 'You have no permission to edit this review'
      redirect_to district_path(@district)
    end
  end

  def new
    @review = Review.new
    @district = District.find(params[:district_id])
  end

  def create
    @district = District.find(params[:district_id])
    @review = Review.new(review_params)
    @review.district = @district
    @review.user_id = current_user.id

    if @review.save
      ReviewMailer.new_review(@review).deliver
      flash[:success] = "Review added successfully"
      redirect_to @district
    else
      @review.errors.any?
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @district = District.find(params[:district_id])
    @review = @district.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review deleted'
    redirect_to district_path(@district)
  end

  protected

  # def review_params
  #   params.require(:review).permit(:title, :body, :rating)
  # end
end
