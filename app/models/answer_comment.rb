class AnswerComment < ActiveRecord::Base
  belongs_to :quiz_result
  belongs_to :quiz_answer
  
  validates :description, presence: true
end
