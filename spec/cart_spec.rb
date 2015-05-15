require 'cart'

describe 'cart' do

let(:cart)		{Cart.new}
let(:product)	{double :product, name: 'Suede Shoes', price: 50, category: 'Footwear' }
let(:product2){double :product, price: 100, category: 'Bags' }


before(:each) do
	cart.addItems(product, 2)
end

it 'can have products added' do
	expect(cart.itemArray.keys[0].name).to eq 'Suede Shoes'
	expect(cart.itemArray.values[0]).to eq 2
end

it 'can have products removed' do
	cart.removeItems(product, 1)
	expect(cart.itemArray.values[0]).to eq 1
end

it 'removes products entirely if the quantity is zero' do
	cart.removeItems(product, 2)
	expect(cart.itemArray.values[0]).to eq nil
end

context 'price totals' do
	it 'can calculate the total price of individual products' do
		expect(cart.totalItemPrice(product)).to eq 100
	end

	it 'can calculate the overall pre-discount price' do
		cart.addItems(product2, 1)
		expect(cart.overallPreDiscountPrice).to eq 200
	end
end

context 'discounts' do
	it 'can apply the £5 voucher' do
		cart.applyVoucher5
		expect(cart.overallPostDiscountPrice).to eq 95
	end

	it 'can apply the £10 voucher' do
		cart.applyVoucher10
		expect(cart.overallPostDiscountPrice).to eq 90
	end

	it 'does not accept the £10 discount for orders not over £50' do
		cart.removeItems(product,1)
		cart.applyVoucher10
		expect(cart.overallPostDiscountPrice).to eq 50
	end

	it 'can apply the £5 and £10 vouchers together' do
		cart.applyVoucher5	
		cart.applyVoucher10
		expect(cart.overallPostDiscountPrice).to eq 85
	end

	it 'can apply the £15 voucher' do
		cart.applyVoucher15
		expect(cart.overallPostDiscountPrice).to eq 85
	end

	it 'does not accept the £15 voucher for non-footwear' do
		cart.removeItems(product,2)
		cart.addItems(product2, 1)
		cart.applyVoucher15
		expect(cart.overallPostDiscountPrice).to eq 100
	end

	it 'can apply all vouchers together' do
		cart.applyVoucher5
		cart.applyVoucher10
		cart.applyVoucher15
		expect(cart.overallPostDiscountPrice).to eq 70
	end
end

end