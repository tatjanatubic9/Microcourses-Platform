class QuizAnswer < ActiveRecord::Base
  belongs_to :pending_quiz
  belongs_to :question
  
end
