class Api::DistrictsController < ApiController
  def index
    @districts = District.all

    respond_to do |format|
      format.json do
        render json: { districts: @districts }
      end
    end
  end
end
