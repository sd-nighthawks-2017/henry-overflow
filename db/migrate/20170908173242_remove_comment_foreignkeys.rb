class RemoveCommentForeignkeys < ActiveRecord::Migration[5.1]
  def change
    remove_column(:comments, :question_id)
    remove_column(:comments, :answer_id)
  end
end
