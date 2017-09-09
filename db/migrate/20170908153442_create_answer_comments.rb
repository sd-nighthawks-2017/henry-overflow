class CreateAnswerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comments do |t|
      t.integer :answer_id
      t.integer :comment_id
    end
  end
end
