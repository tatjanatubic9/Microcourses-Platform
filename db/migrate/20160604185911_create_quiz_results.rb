class CreateQuizResults < ActiveRecord::Migration
  def change
    create_table :quiz_results do |t|
      t.integer :grade
      t.references :user, index: true, foreign_key: true
      t.references :pending_quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
