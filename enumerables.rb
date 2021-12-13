class Array
    def my_each
        i = 0
        while i < self.length
            puts self[i]
            i += 1
        end
        return self
    end
end

#spooky shit
arr = [1, 2, 3]
arr.my_each

#aladeen mf