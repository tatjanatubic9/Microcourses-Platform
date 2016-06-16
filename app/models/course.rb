class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  has_one :quiz
  has_many :votes
  
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
  
end
