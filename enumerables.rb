require "byebug"
class Array
    def my_each
        i = 0
        while i < self.length
            puts self[i]
            i += 1
        end
        return self
    end
    
    def my_reject(&prc)
        self.select { |ele|!prc.call(ele) }
    end 

    def my_select(&prc)
        self.reject { |ele| !prc.call(ele) }
    end

    def my_any?(&prc)
        count = 0
        self.each do |ele|
            count += 1 if prc.call(ele)
        end
        count > 0 
    end
    
    def my_all?(&prc)
        count = 0
        self.each do |ele|
            count += 1 if prc.call(ele)
        end
        count == self.length
    end

    def my_flatten
        # return [self] if !self.is_a?(Array)

        flattened = []
        self.each do |ele|
            # debugger
            if !ele.is_a?(Array)
                flattened << ele
            else
                flattened += ele.my_flatten
            end 
        end 
        flattened
    end

    def my_zip(*array)
        new_arr = Array.new(self.length){Array.new}

        new_arr.each.with_index do |sub_arr, i|
            sub_arr << self[i]
            array.each do |other_sub|
                sub_arr << other_sub[i]
            end 
        end
        
        # l = self.map(&:length).max 
        # new_array = self.map { |sub| sub.values_at(0...l) }
        # new_array.transpose
    end





end

#spooky shit
arr = [1, 2, 3]
p arr.my_each
p arr.my_reject { |num| num > 1 }
p arr.my_select { |num| num > 1 }
p arr.my_any? { |num| num > 1 }
p arr.my_all? { |num| num > 1 }

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
# p a.my_zip(b)
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
