class Product

require 'rubygems'
require 'json'

def initialize
  json = File.read('products.json')
  @items = JSON.parse(json)
end

def all_items
  @items[0]
end

def all_item_names
  all_items.keys
end

def item_price(item)
  all_items[item]["Price"]
end

def item_category(item)
  all_items[item]["Category"]
end

def item_stock(item)
  all_items[item]["Stock"]
end

end