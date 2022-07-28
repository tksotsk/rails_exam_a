class Post < ApplicationRecord
  validates :content,
  length: { minimum: 1, maximum: 140 }
 
  validates :content,
  presence: true
end
