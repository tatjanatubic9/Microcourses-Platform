class CreateQuizAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_answers do |t|
      t.references :pending_quiz, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
