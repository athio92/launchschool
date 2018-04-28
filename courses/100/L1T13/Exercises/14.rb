contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"],
            ["kelly@email.com", "504 Error Dr.", "504-234-9992"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}, "Kelly Kidd" => {}}
fields=[:email, :address, :phone]

contacts.each_with_index do | (key, value), index|
  fields.each do |field|
    value[field] = contact_data[index].shift
  end
end


puts contacts.to_s
