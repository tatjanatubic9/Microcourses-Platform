class PendingQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  has_many :quiz_answers, dependent: :destroy
  accepts_nested_attributes_for :quiz_answers

end
