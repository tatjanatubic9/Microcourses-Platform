class QuizController < ApplicationController
  before_action :set_course
  before_action :set_quiz,  only: [:show, :edit, :update, :destroy]
  
  
  def index
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
      redirect_to @quiz
    else
      render nothing: true #TO DO 
    end
  end
  
  def destroy
  end
  
  private
  
  def set_course
    @course = Course.find(params[:course_id])
  end
  
  def set_quiz
   @quiz = @course.quiz
  end
  
end
