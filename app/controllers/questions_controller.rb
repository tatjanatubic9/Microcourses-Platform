class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
  
  def create
    @question = @quiz.questions.build(questions_params)
    @question.nb = @quiz.questions.size
    
    if @question.save
      redirect_to course_quiz_path(@quiz.course, @quiz)
    else
      render nothing: true #TO DO
    end
  end
  
  def destroy
  end
  
  private
  
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
  
  def set_question
    @question = @quiz.questions.find(params[:question_id])
  end
  
  def questions_params
    params.require(:question).permit(:description)
  end
end
