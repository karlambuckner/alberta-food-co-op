class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates :content, presence: true, length: {minimum: 50, maximum: 250}
  validates :rating, :presence => true
  validates :rating, :inclusion => 1..5
end
