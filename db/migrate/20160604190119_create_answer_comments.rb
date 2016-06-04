class CreateAnswerComments < ActiveRecord::Migration
  def change
    create_table :answer_comments do |t|
      t.text :description
      t.references :quiz_result, index: true, foreign_key: true
      t.references :quiz_answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
