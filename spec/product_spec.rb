require 'product'

describe 'product' do

let(:product)	{Product.new('Suede Shoes', 50, 'Footwear')}

it 'has a name, price and category' do
  expect(product.name).to eq 'Suede Shoes'
  expect(product.price).to eq 50
  expect(product.category).to eq 'Footwear'
end







end