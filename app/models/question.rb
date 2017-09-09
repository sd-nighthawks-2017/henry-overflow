class Question < ApplicationRecord
  belongs_to :user
  has_many :question_comments
  has_many :comments, through: :question_comments
  has_many :answers

  validates :title, :body, { presence: true }
end
