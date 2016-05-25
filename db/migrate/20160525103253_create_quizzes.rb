class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
