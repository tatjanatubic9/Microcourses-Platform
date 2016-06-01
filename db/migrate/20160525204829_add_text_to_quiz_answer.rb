class AddTextToQuizAnswer < ActiveRecord::Migration
  def change
    add_column :quiz_answers, :answer, :text
  end
end
