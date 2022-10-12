class Player
    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        coordinates = gets.chomp
        arr = coordinates.split(" ")
        arr.map!(&:to_i)
    end
end
