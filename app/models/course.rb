class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  has_one :quiz
end
