class Quiz < ActiveRecord::Base
    belongs_to :course
    has_many :questions
    has_many :pending_quizzes, dependent: :destroy
end
