class Board


    def initialize(size)
        @size = size
        @board = Array.new(size) { Array.new(size, "_") }
    end

    def [](position)
        @board[position.first][position.last]
    end

    def []=(position,value)
        @board[position.first][position.last] = value
    end

    def valid?(position)
        if position.first > (@size-1) || position.last > (@size-1) || position.first < 0 || position.last < 0
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
        @board.each { |row| return true if row.count(mark) == @size && row.count("_") == 0 }
        false
    end

    def win_col?(mark)
        @board.transpose.each { |col| return true if col.count(mark) == @size && col.count("_") == 0 }
        false
    end

    def win_diagonal?(mark)
        diagonal1 = []
        diagonal2 = []
        (0...@board.length).each do |i|
            diagonal1 << @board[i][i]
            diagonal2 << @board[i][@board.length - i - 1]
        end
        if (diagonal1.count(mark) == @size || diagonal2.count(mark) == @size) && (diagonal1.count("_") == 0 || diagonal2.count("_") == 0)
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

    def legal_positions
        result = []
        @board.each_with_index do |col,row_idx|
            col.each_with_index do |ele,col_idx|
                if ele == "_"
                    result << [row_idx,col_idx]
                end
            end
        end
        result
    end

end

# g = Board.new(5)
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