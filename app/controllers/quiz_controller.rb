class QuizController < ApplicationController
  load_and_authorize_resource :except => [:create, :index]
  before_action :set_course, except: :index
  before_action :set_quiz,  only: [:show, :edit, :update, :destroy]
  
  def index
     @pending_quizzes = PendingQuizzesHelper.get_pending_quizzes
     @quiz_results = QuizResultsHelper.get_quizzes_results
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    @quiz = @course.build_quiz
    
    if @quiz.save
      redirect_to course_quiz_path(@quiz.course,@quiz)
    else
      render nothing: true #TO DO 
    end
  end
  
  def destroy
    @quiz.destroy
    redirect_to @course
  end
  
  private
  
  def set_course
    @course = Course.find(params[:course_id])
  end
  
  def set_quiz
   @quiz = @course.quiz
  end
  
end
