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
