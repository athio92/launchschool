 #This 'wraps' the recursive sort. Use .dup to pass in a COPY of original array to avoid mutation
def sort_case_sensitive (unsorted_arr)
  recursive_sort(unsorted_arr.dup,[],true)
end

def sort_case_insensitive(unsorted_arr)
  recursive_sort(unsorted_arr.dup,[],false)
end

def recursive_sort (unsorted_arr, sorted_arr,case_sensitive)
  if (unsorted_arr.length <= 0)
     return sorted_arr  #terminate since unsorted_arr is empty
  else
    if (sorted_arr.length==0)
      #If sorted_arr is empty, just cut unsorted_arr[0] into sorted_arr[0]
      sorted_arr.insert(0,unsorted_arr.delete_at(0))
      return recursive_sort(unsorted_arr,sorted_arr,case_sensitive)
    else
      #Sorted_arr is not empty. Compare first member of unsorted_arr with each items in sorted_arr
      #If unsorted_arr[0] < sorted_arr[i], cut unsorted_arr[0] and paste into sorted_arr[i]
      #if i reaches sorted_arr.length
      
      if case_sensitive==true
        for i in 0..sorted_arr.length do
          if (i==sorted_arr.length || unsorted_arr[0]<sorted_arr[i]) #
            sorted_arr.insert(i,unsorted_arr.delete_at(0))
            return recursive_sort(unsorted_arr,sorted_arr,case_sensitive)    
          end
        end
      else
        #not case sensitive, so we compare downcase
        for i in 0..sorted_arr.length do
          if (i==sorted_arr.length || unsorted_arr[0].downcase<sorted_arr[i].downcase) #
            sorted_arr.insert(i,unsorted_arr.delete_at(0))
            return recursive_sort(unsorted_arr,sorted_arr,case_sensitive)    
          end
        end
      end
    end
  end

  #note: use sorted_arr.insert(i,unsorted_arr.delete_at(0)) .() delete_at returns the deleted element)
  #Recursively call this method with new unsorted_arr and sorted_arr, and bubble up the result. 
  #Recursion should terminate once unsorted_arr is empty (length is 0)
  
end

words = ['boo','cow','ant','Black','Zebra', 'baa','9', '20']
puts sort_case_sensitive(words).join(" ")
puts ""
puts sort_case_insensitive(words).join(" ")