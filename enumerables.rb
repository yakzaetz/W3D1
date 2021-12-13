class Array
    def my_each
        i = 0
        while i < arr.length
            puts self[i]
            i += 1
        end
        return self
    end
end