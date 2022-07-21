class Exeter
    def initialize(w,h)
        @width, @height = w, h
    end



    def printWidth
        @width
    end

    def printHeight
        @height
    end
end

box = Exeter.new(10, 20)

x = box.printWidth()
y = box.printHeight()

puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"