class ProfilesController < ApplicationController
  def show
    if current_user.teacher?
      @pending_quizzes = PendingQuizzesHelper.get_pending_quizzes.sort_by &:created_at
    elsif current_user.student?
      @pending_quizzes = current_user.pending_quizzes.sort_by &:created_at
    end
    
    @quiz_results = QuizResultsHelper.get_quizzes_results.sort_by &:created_at
    @courses =[]
    
    if current_user.teacher? && current_user.courses != nil
      @courses = current_user.courses
    elsif current_user.student?
      @pending_quizzes.each do |pq|
        @courses << pq.quiz.course
      end
    end
    
    sum_of_grades = 0
    @quiz_results.each do |qr|
      sum_of_grades += qr.grade
    end
    if @quiz_results.size == 0
    	@average_quiz_result = 0
    else
    	@average_quiz_result = sum_of_grades / @quiz_results.size
    end
    
    @courses = @courses.sort_by &:created_at

  end
end
