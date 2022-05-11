class Mutalk < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: {minimum: 1, maximum: 20}
  validates :content, presence: true, length: {minimum: 1, maximum: 1000}
  
end
