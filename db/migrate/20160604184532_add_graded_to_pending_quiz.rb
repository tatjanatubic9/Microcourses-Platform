class AddGradedToPendingQuiz < ActiveRecord::Migration
  def change
    add_column :pending_quizzes, :graded, :boolean
  end
end
