class Question < ApplicationRecord
  belongs_to :user
  has_many :question_comments
  has_many :comments, through: :question_comments
  has_many :answers

  has_many :votes, as: :votable

  validates :title, :body, { presence: true }
end
