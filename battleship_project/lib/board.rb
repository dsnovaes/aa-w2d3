class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n*n
    end

    def self.print_grid(arr)
        arr.each do |subArr|
            puts subArr.join(" ")
        end

    end

    def [](position)
        @grid[position.first][position.last]
    end

    def []=(position,value)
        @grid[position.first][position.last] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        aim = self[position]
        if aim == :S
            self[position] = :H
            p "you sunk my battleship!"
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        count = 0
        ratio = @grid.flatten.count * 0.25
        until count == ratio
            max = @grid.first.length
            coord_x = rand(0...max)
            coord_y = rand(0...max)
            spot = [coord_x,coord_y]
            if self[spot] != :S
                self[spot] = :S
                count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |subArr|
            subArr.map { |ele| ele == :S ? :N : ele }
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
