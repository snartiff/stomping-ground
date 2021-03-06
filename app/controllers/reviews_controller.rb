class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @district = District.find(params[:district_id])
    redirect_to @district
  end

  def show
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
      ReviewMailer.new_review(@review).deliver_now
      flash[:success] = "Review added successfully"
      redirect_to district_path(@review.district)
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

  def edit
    @district = District.find(params[:district_id])
    @review = @district.reviews.find(params[:id])
  end

  def update
    @district = District.find(params[:district_id])
    @review = @district.reviews.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @district
    else
      render :edit
    end
  end

  protected

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
