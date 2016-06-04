class DropAnswerComments < ActiveRecord::Migration
  def change
    drop_table :answer_comments
  end
end
