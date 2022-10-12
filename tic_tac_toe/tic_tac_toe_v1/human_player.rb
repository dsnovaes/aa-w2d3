class HumanPlayer

    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        allowed = "0123456789"
        p "Type where you want to position #{@mark}." 
        p "Use two numbers with a space between them."
        position = gets.chomp
        arr = position.split(" ")
        arr.each do |coordinates|
            if !allowed.include?(coordinates)
                raise "invalid position"
            elsif arr.count != 2
                raise "type only 2 numbers"
            end
        end
        arr.map(&:to_i)
    end

end