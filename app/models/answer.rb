
class Answer < ActiveRecord::Base
  attr_accessible :howOftenChosen, :id, :isRight, :text
  has_and_belongs_to_many :statistics
end
