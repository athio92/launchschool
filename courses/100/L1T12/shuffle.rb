class Array
  def shuffle
    arr = self.dup  #create copy to prevent mutating original array
    
    for i in (0..arr.length-1)
      r = rand(0..arr.length-1)
  
      #replace arr[i] with arr[r]
      temp = arr[i]
      arr[i] = arr[r]
      arr[r] = temp
        
    end
  
    return arr
  end

end



puts ['a','b','c','d'].shuffle