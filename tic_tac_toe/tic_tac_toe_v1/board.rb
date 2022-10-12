# require "game.rb"
# require "human_player.rb"

class Board


    def initialize
        @board = Array.new(3) { Array.new(3, "_") }
    end

    def [](position)
        @board[position.first][position.last]
    end

    def []=(position,value)
        @board[position.first][position.last] = value
    end

    def valid?(position)
        if position.first > 2 || position.last > 2 || position.first < 0 || position.last < 0
            raise "choose other position"
            false
        else
            true
        end

    end

    def empty?(position)
        if self[position] == "_"
            true
        else
            raise "choose other position"
            false
        end

    end

    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "choose other position"
        else
            self[position] = mark
        end
    end

    def print
        puts
        @board.each { |row| puts row.join(" | ") }
        puts
    end

    def win_row?(mark)
        @board.each { |row| return true if row.count(mark) == 2 && row.count("_") == 1 }
        false
    end

    def win_col?(mark)
        @board.transpose.each { |col| return true if col.count(mark) == 2 && col.count("_") == 1 }
        false
    end

    def win_diagonal?(mark)
        diagonal1 = []
        diagonal2 = []
        (0...@board.length).each do |i|
            diagonal1 << @board[i][i]
            diagonal2 << @board[i][@board.length - i - 1]
        end
        if (diagonal1.count(mark) == 2 || diagonal2.count(mark) == 2) && (diagonal1.count("_") == 1 || diagonal2.count("_") == 1)
            return true 
        else
            false
        end
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            true
        else
            false
        end
    end

    def empty_positions?
        return true if @board.flatten.count("_") > 0
        false
    end

end

# g = Board.new
# g.place_mark([1,1],:X)
# p g.empty_positions?
# g.place_mark([0,1],:O)
# p g.empty_positions?
# g.place_mark([0,2],:X)
# p g.empty_positions?
# g.place_mark([1,0],:X)
# g.print
# p g.win?(:X)
# p g.empty_positions?