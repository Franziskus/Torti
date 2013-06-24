class Statistic < ActiveRecord::Base
  attr_accessible :id, :student_id
  has_and_belongs_to_many :answers
  belongs_to :student, :foreign_key => "student_id"
  
  public
 	def answersCount
 		count = 0
 		for i in 0...answers.length
  			if (answers[i].isRight)
  				count+=1
  			end
		end		
		return count
	end
  end
