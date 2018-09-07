require 'byebug'
class QuickSort
    def self.quick_sort(array, start = 0, len = array.length)
        return array if len <= 1
        # debugger
        pivot = array[start]
        boundary = start + 1

        i = start + 1
        while i < start + len
            if pivot <= array[i]
                i += 1
            else
                array[i], array[boundary] = array[boundary], array[i]
                boundary += 1
                i+=1
            end
        end
        pivot_idx = boundary - 1
        array[start], array[pivot_idx] = array[pivot_idx], array[start]

        QuickSort.quick_sort(array, start, pivot_idx-start)
        QuickSort.quick_sort(array, boundary, len-boundary)
    end
end

p QuickSort.quick_sort([4,3,7,6,1,9,2,5])