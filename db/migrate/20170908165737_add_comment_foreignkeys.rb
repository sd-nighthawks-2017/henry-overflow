class AddCommentForeignkeys < ActiveRecord::Migration[5.1]
  def change
    add_column(:comments, :question_id, :integer)
    add_column(:comments, :answer_id, :integer)
  end
end
