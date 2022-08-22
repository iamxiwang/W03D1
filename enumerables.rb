class Array

    def my_each(&prc)
        i = 0

        while i < self.length 
            prc.call(self[i])
            i += 1
        end
    end

    def my_select(&prc)
        output = []
        self.each do |ele|
            if prc.call(ele)
                output << ele
            end
        end
        output
    end

    def my_reject(&prc)
        output = []
        self.each do |ele|
            if !prc.call(ele)
                output << ele
            end
        end
        output
    end

    def my_any?(&prc)
        self.each do |ele|
            if prc.call(ele)
                return true
            end
        end
    end

    def my_all?(&prc)
        self.each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        return true
    end

    def my_flatten
        if !self.is_a (Array)
            return [self]
        end

        output = []

        self.each{|ele| output+[ele.my_flatten]}
    end

    def my_zip(*arr)
        group_arrs = arr << self
        (0..self.length).map{|i| group_arrs.map{|ele| ele[i]}}
    end

    def my_rotate(amount = 1)
        if amount > 0
            amount.times do
                self << self.unshift
            end
        else
            (-amount).times do 
                self.unshift(self.pop)
            end
        end
    end

    def my_join(seperator = " ")
        self.join(seperator)
    end

    def my_reverse
        
    end

end

        