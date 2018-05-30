# Bubble Sort for Array

def bubble_sort!(arr)
  swap_count = 0
  loop do 
    n = arr.length - 2
    # do one-pass iteration & swapping through array 
    for i in 0..n do
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swap_count += 1
      end
      # Optimization: xth iteration will bring xth smallest element to final position
      # so we can skip doing comparison.
      n -= 1
    end
    # signals done if no swap are made
    break if swap_count == 0
    # resets counter for next iteration
    swap_count = 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = [6, 2, 7, 1, 4, 1, 1, 1, 2, 1, 3, 4, 2, 1, 1, 2, 3, 4, 5, 3, 2, 1, 2,1]
bubble_sort!(array)
p array