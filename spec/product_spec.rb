require 'product'

describe 'product' do

let(:product)	{Product.new}

it 'can retrieve the correct prices, categories and stock counts' do
	expect(product.item_price("Suede Shoes, Blue")).to eq 42
	expect(product.item_category("Suede Shoes, Blue")).to eq "Women's Footwear"
	expect(product.item_stock("Suede Shoes, Blue")).to eq 4
end

end