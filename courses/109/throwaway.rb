require 'pry'

PRODUCTS = [
  { name: "Thinkpad x210", price: 220},
  { name: "Thinkpad x220", price: 250},
  { name: "Thinkpad x250", price: 979},
  { name: "Thinkpad x230", price: 300},
  { name: "Thinkpad x230", price: 330},
  { name: "Thinkpad x230", price: 350},
  { name: "Thinkpad x240", price: 700},
  { name: "Macbook Leopard", price: 300},
  { name: "Macbook Air", price: 700},
  { name: "Macbook Pro", price: 600},
  { name: "Macbook", price:1449},
  { name: "Dell Latitude", price: 200},
  { name: "Dell Latitude", price: 650},
  { name: "Dell Inspiron", price: 300},
  { name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q:"thinkpad"
}
query2 = {
  price_min: 300,
  price_max: 450,
  q:"dell"
}


def search(query)
  binding.pry
  PRODUCTS.select do |product|
    binding.pry
    product[:name].match?(/#{query[:q]}/i) && (query[:price_min]..query[:price_max]).cover?(product[:price])
  end
end

p search(query)
p search(query2)

##############

def parentheses_balanced?(str)
  counter = 0
  str.each_char do |char|
    if char == "("
      counter += 1
    elsif char == ")"
      counter -= 1
    end
    # immediate return if counter goes negative
    return false if counter < 0
  end
  counter == 0
end

p parentheses_balanced?("hi")
p parentheses_balanced?("hi(")
p parentheses_balanced?("hi(asad)")
p parentheses_balanced?("hi)as(")
p parentheses_balanced?("hi(asd(as)fw)")
p parentheses_balanced?("hi(asd(as)fwqaa")

