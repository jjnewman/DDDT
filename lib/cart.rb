class Cart

attr_accessor :itemArray

def initialize
	@itemArray = Hash.new(0)
end

def addItems(product, quantity)
	@itemArray[product] += quantity
end

def removeItems(product, quantity)
	if quantity > @itemArray[product]
		raise "quantity can't be negative"
	else
		@itemArray[product] -= quantity
		@itemArray.delete(product) if @itemArray[product] == 0 
	end
end

def totalItemPrice(product)
	@itemArray[product] * product.price 
end

def overallPrice
	totalPrice = 0
	@itemArray.each {|product, qty| totalPrice += totalItemPrice(product)}
	totalPrice
end

end