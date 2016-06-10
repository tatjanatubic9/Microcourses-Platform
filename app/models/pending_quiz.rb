class PendingQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  has_one :quiz_result, dependent: :destroy
  has_many :quiz_answers, dependent: :destroy, inverse_of: :pending_quiz
  accepts_nested_attributes_for :quiz_answers
  
end
