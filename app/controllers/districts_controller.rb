class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def show
    @district = District.find(params[:id])
    @reviews = @district.reviews
    @review = Review.new
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)
    if @district.save
      flash[:success] = "District added successfully"
      redirect_to districts_path
    else
      @district.errors.any?
      flash[:notice] = @district.errors.full_messages.join(", ")
      render :new
    end
  end
end

private

def district_params
  params.require(:district).permit(:name)
end
