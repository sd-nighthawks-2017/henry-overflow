class QuestionComment < ApplicationRecord
  belongs_to :question
  belongs_to :comment
end
