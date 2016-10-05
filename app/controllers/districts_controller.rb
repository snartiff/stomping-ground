class DistrictsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @districts = District.all
  end

  def show
    @district = District.find(params[:id])
    @reviews = @district.reviews
    @average_rating = 0.0
    @reviews.each do |r|
      @average_rating += r.rating
    end
    @average_rating = @average_rating.fdiv(@reviews.length)

    @review = Review.new
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)
    @district.user = current_user
    if @district.save
      redirect_to @district
      flash[:success] = "District added successfully"
    else
      @district.errors.any?
      flash[:notice] = @district.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def district_params
    params.require(:district).permit(:name, :description)
  end
end
