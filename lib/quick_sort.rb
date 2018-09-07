class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2)

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]
    left = []
    right = []

    i=1
    while i<array.length
      left << array[i] if array[i] <= pivot
      right << array[i] if array[i] > pivot
      i+=1
    end

    return QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    # prc ||= Proc.new { |i, j| i <=> j }
 
    #  return array if length < 2
 
    #  pivot_idx = partition(array, start, length, &prc)
 
    #  leftlen = pivot_idx - start
    #  rightlen = length - (leftlen + 1)
    #  sort2!(array, start, leftlen, &prc)
    #  sort2!(array, pivot_idx + 1, rightlen, &prc)
    prc ||= Proc.new {|i,j| i <=> j}

    return array if length <= 1
    
    boundary = QuickSort.partition(array, start, length, &prc)

    leftlen = boundary - start
    rightlen = length - (leftlen + 1)

    sort2!(array,start, leftlen, &prc)
    sort2!(array,boundary+1, rightlen, &prc)

  end

  #  prc ||= Proc.new { |i, j| i <=> j }
  
  #  pivot_idx = start
  #  pivot = array[start]
  #  ((start + 1)...(start + length)).each do |idx|
  #    if prc.call(pivot, array[idx]) > 0
  #      array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
  #      pivot_idx += 1
  #    end
  #  end
  #  array[start], array[pivot_idx] = array[pivot_idx], array[start]
  
  #  pivot_idx
  
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|i,j| i <=> j }
    boundary = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |i|
      if prc.call(pivot, array[i]) > 0
        array[i], array[boundary + 1] = array[boundary + 1], array[i]
        boundary += 1
      end
    end
    array[start], array[boundary] = array[boundary], array[start]
    boundary


  end
end

# p QuickSort.sort1([2,5,4,8,1,3])

