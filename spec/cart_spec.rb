require 'cart'

describe 'cart' do

let(:cart)		{Cart.new}
let(:product)	{double :product, name: 'Suede Shoes', price: 50, category: 'Footwear' }
let(:product2){double :product, price: 100 }

it 'can have products added' do
	cart.addItems(product, 2)
	expect(cart.itemArray.keys[0].name).to eq 'Suede Shoes'
	expect(cart.itemArray.values[0]).to eq 2
end

it 'can have products removed' do
	cart.addItems(product, 2)
	cart.removeItems(product, 1)
	expect(cart.itemArray.values[0]).to eq 1
end

it 'cannot have a negative quantity of products' do
	expect{cart.removeItems(product, 1)}.to raise_error
end

it 'removes the product entirely if the quantity is zero' do
	cart.addItems(product, 2)
	cart.removeItems(product, 2)
	expect(cart.itemArray.values[0]).to eq nil
end

it 'is able to show the total price of individual products' do
	cart.addItems(product, 2)
	expect(cart.totalItemPrice(product)).to eq 100
end

it 'is able to calculate the overall price' do
	cart.addItems(product, 2)
	cart.addItems(product2, 1)
	expect(cart.overallPrice).to eq 200

end

end