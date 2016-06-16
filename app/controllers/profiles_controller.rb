class ProfilesController < ApplicationController
  def show
    @pending_quizzes = PendingQuizzesHelper.get_pending_quizzes
    @quiz_results = QuizResultsHelper.get_quizzes_results
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
    @average_quiz_result = sum_of_grades / @quiz_results.size
  end
end
