class Api::DistrictsController < ApiController
  def index
    @districts = District.all

      respond_to do |format|
        format.json do
          render json: { districts: @districts }
        end
      end
    
  end

  # def show
  #   @question = Question.all.sample
  #   @answers = Answer.where(question_id: @question.id)
  #
  #   respond_to do |format|
  #     format.json do
  #       render json: { question: @question, answers: @answers }
  #     end
  #   end
  # end

end
