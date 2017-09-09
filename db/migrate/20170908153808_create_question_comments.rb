class CreateQuestionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :question_comments do |t|
      t.integer :question_id
      t.integer :comment_id
    end
  end
end
