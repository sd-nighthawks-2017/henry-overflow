class Comment < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :votable
  has_many :answer_comments
  has_many :answers, through: :answer_comments
  has_many :question_comments
  has_many :questions, through: :question_comments
end
