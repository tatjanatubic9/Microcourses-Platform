module QuizResultsHelper
    def self.get_quizzes_results
        @result_quizzes = []
        if User.current_user.teacher?
          student_pq = User.current_user.quiz_results
          if student_pq.nil?
            puts @result_quizzes
            return @result_quizzes
          end
          student_pq.each do |s|
              @result_quizzes << s
          end
        elsif User.current_user.student?
          @pen_quizzes = User.current_user.pending_quizzes
            if @pen_quizzes.nil? 
              return @result_quizzes
            end
          @pen_quizzes.each do |c|
            if c.quiz_result.nil? || c.graded==false || c.graded.nil?
              next
            end
            @result_quizzes << c.quiz_result
          end
        end
        @result_quizzes
    end
end
