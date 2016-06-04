class QuizResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :pending_quiz
  has_many :answer_comments, dependent: :destroy
  accepts_nested_attributes_for :answer_comments
end
