class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password 
  attr_accessible :username, :email, :password, :password_confirmation
end
