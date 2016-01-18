class Article < ActiveRecord::Base
  #user singular since article is the many side of the association
  belongs_to :user
  #maintaining data integrity by adding validation by enforcing constraints
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  #ensures user id is present
  validates :user_id, presence: true
end
