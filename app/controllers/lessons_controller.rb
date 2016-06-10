class LessonsController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]
  before_action :set_course
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
    @lesson = @course.lessons.new
  end
  
  def create
    @lesson = @course.lessons.build(lessons_params)
    
    if @lesson.save
      redirect_to @course
    else
      flash[:error] = @lesson.errors
      render :template => "courses/show"
    end
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
    @lesson.destroy
    redirect_to @course
  end
  
  private
  
  def set_course
    @course = Course.find(params[:course_id])
  end
  
  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  end
  
  def lessons_params
    params.require(:lesson).permit(:name,:description,:link)
  end

end
