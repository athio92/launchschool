def swap_name(fullname)
  fullname.split.reverse.join(", ")
end


p swap_name('Joe Roberts') == 'Roberts, Joe'