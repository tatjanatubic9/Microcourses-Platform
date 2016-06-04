class DropQuizResult < ActiveRecord::Migration
  def change
    drop_table :quiz_results
  end
end
