class CommentsController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]
  before_action :set_lesson
  before_action :set_commemt, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    
  end
  
  def new
  end
  
  def create
    @comment = @lesson.comments.build(comments_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to course_lesson_path(@lesson.course, @lesson)
    else
      flash[:error] = @comment.errors
      render :template => "lessons/show"
    end
    
  end
  
  private 
  
  def set_comment
    @comment = @lesson.comments.find(params[:id])
  end
  
  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
  
  def comments_params
    params.require(:comment).permit(:description)
  end
end
