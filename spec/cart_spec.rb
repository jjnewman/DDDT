require 'cart'

describe 'cart' do

let(:cart)		{Cart.new}
let(:product)	{double :product, name: 'Suede Shoes', price: 50, category: 'Footwear' }


it 'can have products added' do
	cart.addItems(product, 2)
	expect(cart.itemArray.keys[0].name).to eq 'Suede Shoes'
	expect(cart.itemArray.values[0]).to eq 2

end


end