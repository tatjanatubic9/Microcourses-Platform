class PendingQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  has_one :quiz_result
  has_many :quiz_answers
  accepts_nested_attributes_for :quiz_answers
end
