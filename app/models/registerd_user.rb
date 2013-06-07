class RegisterdUser < ActiveRecord::Base
  attr_accessible :email, :id, :password, :registerdSince, :type
end
