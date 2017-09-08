class Answer < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
end
