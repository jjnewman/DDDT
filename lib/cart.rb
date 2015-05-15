class Cart

attr_accessor :itemArray

def initialize
	@itemArray = Hash.new(0)
end

def addItems(product, quantity)
	@itemArray[product] += quantity
end


end