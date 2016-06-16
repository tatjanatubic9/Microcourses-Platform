class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :comments
  
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
  validates :link, presence: true, format: {with: /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/}
end
