module PendingQuizzesHelper
    
    def self.get_pending_quizzes
        @pending_quizzes = []
        if User.current_user.student?
          student_pq = User.current_user.pending_quizzes
          student_pq.each do |s|
            if s.graded==false
              @pending_quizzes << s
            end
          end
        elsif User.current_user.teacher?
          @courses = User.current_user.courses
            if @courses.nil? 
              return @pending_quizzes
            end
          @courses.each do |c|
            if c.quiz.nil? || c.quiz.pending_quizzes.nil?
              next
            end
            course_q = c.quiz.pending_quizzes
            course_q.each do |p|
              if p.graded == false
                @pending_quizzes << p
              end
            end
          end
        end
        @pending_quizzes
    end
    
end
