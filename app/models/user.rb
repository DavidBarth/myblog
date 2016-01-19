class User < ActiveRecord::Base
  # the user is the 1 side of the one_to_many association
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            uniqueness: { case_sensitive:false }, 
            length: { minimum: 3, maximum: 25 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  
  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  #modify gem file according to the info in the above link
  has_secure_password
end