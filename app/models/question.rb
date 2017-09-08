class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  validates :title, :body, { presence: true }
end
