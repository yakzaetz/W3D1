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

    





end

#spooky shit
arr = [1, 2, 3]
p arr.my_each
p arr.my_reject { |num| num > 1 }
p arr.my_select { |num| num > 1 }
p arr.my_any? { |num| num > 1 }
p arr.my_all? { |num| num > 1 }


