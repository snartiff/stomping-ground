class ReviewsController < ApplicationController
  def index
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

    if @review.save
      flash[:success] = "District added successfully"
      redirect_to districts_path(@district)
    else
      @review.errors.any?
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :new
    end

  end

  protected

  def review_params
    params.require(:review).permit(:title, :body, :rating, :tags)
  end
end
