class Answer < ApplicationRecord
  belongs_to :votable, polymorphic: true
end
