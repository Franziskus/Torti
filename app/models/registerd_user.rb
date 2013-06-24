class RegisterdUser < ActiveRecord::Base
  attr_accessible :email, :id, :password, :registerdSince, :type
  has_one :statistic
  
end
