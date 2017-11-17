class Product < ActiveRecord::Base
  has_many :reviews

  scope :most_reviews, -> {(
    select("products.name, products.id, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(5)
  )}

  scope :most_recent, -> { order(created_at: :desc).limit(3) }

  scope :from_usa, -> { where(country: 'USA') }

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true
end
