class Api::DistrictsController < ApiController
  def index
    @districts = District.all

    respond_to do |format|
      format.json do
        render json: { districts: @districts }
      end
    end
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
    params.require(:district).permit(:name, :description, :avatar)
  end


end
