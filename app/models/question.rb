class Question < ApplicationRecord
  belongs_to :user
  has_many :question_comments
  has_many :comments, through: :question_comments
  validates :title, :body, { presence: true }
end
