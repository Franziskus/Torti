class Statistic < ActiveRecord::Base
  attr_accessible :id, :student_id
  has_and_belongs_to_many :answers
  belongs_to :student, :foreign_key => "student_id"
end
