require 'yaml'

def yaml_save_obj(test_obj,filename)
  if (File.exist?(filename)==true)
    puts "File existed already."
    exit
  end
  
  File.open(filename, 'w') do |f|
    f.write(test_obj.to_yaml)
  end
end

def yaml_load(filename)
  yaml_string = File.read(filename)
  return YAML::load yaml_string
end

test_array = ["Bobby\nBill",['Inner 1a', ['Inner 2a', 'Inner 2b', 3, true],'Inner1c'],
              'Charlie is fan-tas-tic!', 'Daphne']

test_hash = {
  "Bob"=>90,
  "Courtney"=>true,
  "18"=>"20"
}

yaml_save_obj(test_array,"ArrayFile.txt")
puts(yaml_load("ArrayFile.txt"))

yaml_save_obj(test_hash,"HashFile.txt")
puts(yaml_load("HashFile.txt"))
