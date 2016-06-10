class QuizAnswer < ActiveRecord::Base
  belongs_to :pending_quiz, inverse_of: :quiz_answers
  belongs_to :question
  
  validates :answer, presence: true
end
