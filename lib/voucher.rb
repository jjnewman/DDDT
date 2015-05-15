module Voucher

def voucher5
	5 
end

def voucher10
	discount = 0
	discount = 10 if overallPreDiscountPrice > 50
	return discount
end

def voucher15
	discount = 0
	discount = 15 if (overallPreDiscountPrice > 75 && (@itemArray.any? {|product, qty| product.category == "Footwear"}))
	return discount
end

end