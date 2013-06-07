class Statistic < ActiveRecord::Base
  attr_accessible :id, :student_fk
  has_and_belongs_to_many :answers
  has_one :student, :foreign_key => "student_fk"
end
