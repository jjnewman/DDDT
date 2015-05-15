class Cart

attr_accessor :itemArray

def initialize
	@itemArray = Hash.new(0)
	@apply5 = false
	@apply10 = false
end

def addItems(product, quantity)
	@itemArray[product] += quantity
end

def removeItems(product, quantity)
	@itemArray[product] -= quantity
	@itemArray.delete(product) if @itemArray[product] == 0 
end

def totalItemPrice(product)
	@itemArray[product] * product.price 
end

def overallPreDiscountPrice
	totalPrice = 0
	@itemArray.each {|product, qty| totalPrice += totalItemPrice(product)}
	totalPrice
end

def voucher5
	-5 
end

def voucher10
	discount = 0
	discount = -10 if overallPreDiscountPrice > 50
	return discount
end



def applyVoucher5
	@apply5 = true
	voucher5
end

def applyVoucher10
	@apply10 = true
	voucher10
end

def totalDiscounts
	total = 0
	@apply5 ? total += voucher5 : total
	@apply10 ? total += voucher10 : total
	
end


def overallPostDiscountPrice
	overallPreDiscountPrice + totalDiscounts
end


end