class Article < ActiveRecord::Base
  #maintaining data integrity by adding validation by enforcing constraints
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
