class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_questions ,only: [:show,:update,:delete,:edit]
  
  def index
  	@questions = Question.all
  end 

  def new 
  	@question = Question.new
  end 

  def show
  	@question = Question.includes(:answers).find(params[:id])
  end 

  def create
  	@question = Question.new(permit_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question
    else 
      flash.alert = @question.errors.full_messages 	
    end 
  end  

  def edit 
  end 

  def update 
    if @question.update(permit_params)
      redirect_to @question
    else 
      render :new	
    end
  end 

  def delete
    if @question.destory
      redirect_to root
    else 
      render :show	
    end
  end 

  private 
    def permit_params
      params.require(:question).permit(:title,:question,:problem_description)
    end 

    def find_questions
      @question = Question.find(params[:id])
    end 
end
