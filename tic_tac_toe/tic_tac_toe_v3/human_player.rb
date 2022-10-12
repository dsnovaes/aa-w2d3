class HumanPlayer

    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(possibilities)
        allowed = "0123456789"
        p "Type where you want to position #{@mark}." 
        p "Choose on from below:"
        p possibilities
        position = gets.chomp
        arr = position.split(" ")
        arr.each do |coordinates|
            if !allowed.include?(coordinates)
                p "invalid position. try again:"
                position = gets.chomp
            elsif arr.count != 2
                p "type only 2 numbers. try again:"
                position = gets.chomp
            end
        end
        arr.map(&:to_i)
    end

end