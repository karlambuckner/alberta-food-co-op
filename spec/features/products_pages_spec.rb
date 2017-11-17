require 'rails_helper'

describe 'visit root route to product path' do
  it 'navigates from root to product path' do
    product = Product.create(:name => 'Avocado', :cost => 2, :country =>"USA")
    visit products_path
    first(:link, 'Avocado').click
    expect(page).to have_content 'Avocado'
  end
end

describe 'visiting new product page and adding a product' do
  it 'navigates to the new product page' do
    visit products_path
    click_link 'Add a New Product'
    fill_in 'Name', :with => 'Avocado'
    fill_in 'Cost', :with => '2'
    fill_in 'Country', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Avocado'
  end
end

describe 'visiting the product edit page, editing a product' do
  it 'navigates to the product edit page' do
    product = Product.create(:name => 'Avocado', :cost => 2, :country =>'USA')
    visit products_path(product)
    first(:link, 'Avocado').click
    click_link 'Edit'
    fill_in 'Name', :with => 'Organic Avocado'
    click_on 'Update Product'
    expect(page).to have_content product.name
  end
end
