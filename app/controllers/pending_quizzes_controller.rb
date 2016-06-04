class PendingQuizzesController < ApplicationController
  before_action :set_quiz
  
  def show
    @pending_quiz = @quiz.pending_quizzes.find(params[:id])
    @quiz_answers = @pending_quiz.quiz_answers 
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
    @pending_quiz = @quiz.pending_quizzes.build(pending_quiz_params)
    @pending_quiz.quiz_answers.each_with_index do |answer,index|
      answer.question_id = @pending_quiz.quiz.questions[index].id
    end
    @pending_quiz.user = current_user
    
    if @pending_quiz.save
      redirect_to course_quiz_pending_quiz_path(@quiz.course, @quiz, @pending_quiz)
    else
      render nothing: true
    end
  end

  def index
    @pending_quizzes = @quiz.pending_quizzes
  end
  
  private
  
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
  
  def pending_quiz_params
    params.require(:pending_quiz).permit( quiz_answers_attributes: [:id, :answer, :question_id])
  end
  
end