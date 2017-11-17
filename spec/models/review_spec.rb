require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should belong_to :product }
end

describe Review do
  it("ensures the ratings are 1-5") do
    review = Review.new({:rating => 6})
    expect(review.save()).to(eq(false))
  end
end
