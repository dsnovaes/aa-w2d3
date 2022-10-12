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
        @board.each { |row| puts row.join("|") }
        puts
    end

    def win_row?(mark)
        @board.each { |row| return true if row.count(mark) == 2 }
        false
    end

    def win_col?(mark)
        @board.transpose.each { |row| return true if row.count(mark) == 2 }
        false
    end

end

