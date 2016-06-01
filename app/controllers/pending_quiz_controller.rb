class PendingQuizController < ApplicationController
  before_action :set_quiz
  
  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @some_quiz = @quiz.pending_quizzes.build
    @quiz_questions = @quiz.questions
    
    @quiz_questions.each do |q|
     @some_quiz.quiz_answers.build(:question_id => q.id)
    end
    
    @answers = @some_quiz.quiz_answers
  end
  
  def create
    @pending_quiz = @quiz.pending_quizes.build(pending_quiz_params)
    @pending_quiz.user = current_user
    
    if @pending_quiz.save
      redirect_to root_path
    else
      render nothing: true
    end
  end

  def index
  end
  
  private
  
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
  
  def pending_quiz_params
    params.require(:pending_quiz).permit( pending_quiz_quiz_answers_attributes: [:answer, :question_id])
  end
  
end
