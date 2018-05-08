vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(vehicles)
  result = {}
  vehicles.each do |vehicle|
    result[vehicle] = vehicles.count(vehicle)
  end
  result
end

puts count_occurrences(vehicles)
