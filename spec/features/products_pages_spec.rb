require 'rails_helper'

describe 'visit root route to product path' do
  it 'navigates from root to product path' do
    product = Product.create(:name => 'Avocado', :cost => 2, :country =>"USA")
    visit products_path
    first(:link, 'Avocado').click
    expect(page).to have_content 'Avocado'
  end
end
