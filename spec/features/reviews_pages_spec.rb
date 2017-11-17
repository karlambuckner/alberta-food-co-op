require 'rails_helper'

describe 'visit product path, route to review details' do
  it 'navigates from product path to review details' do
    product = Product.create(:name => 'Avocado', :cost => 2, :country =>'USA')
    review = product.reviews.create(:author => 'Karla', :content => 'Avocado is the best thing in the whole entire world, I just love it so very much!', :rating => 5)
    visit products_path
    first(:link, 'Avocado').click
    expect(page).to have_content review.author
  end
end

describe 'visit root route to product path, add new review' do
  it 'navigates from root to product path' do
    product = Product.create(:name => 'Avocado', :cost => 2, :country =>'USA')
    visit products_path
    first(:link, 'Avocado').click
    click_link 'Add a review'
    fill_in 'Author', :with => "Karla"
    fill_in 'Content', :with => "Avocado is the best thing in the whole entire world, I just love it so very much!"
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content "Avocado is the best thing in the whole entire world, I just love it so very much!"
  end
end
