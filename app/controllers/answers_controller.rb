class AnswersController < ApplicationController

  def create
  	@question = Question.find(params[:question_id])
  	@answer = Answer.new(permit_params)
  	@answer.user_id = current_user.id
    @answer.question_id = @question.id
  	if @answer.save!
  	  redirect_to @question	
  	else 
  	  flash.alert = @answer.errors 	
  	end 
  end 
  
  private
    def permit_params
      params.require(:answer).permit(:answer)
    end 
end
