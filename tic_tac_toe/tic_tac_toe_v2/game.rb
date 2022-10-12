require_relative "board"
require_relative "human_player"

class Game

    def initialize(size,*marks)
        @players = []
        marks.each { |mark| @players << HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(size)
    end

    def switch_turn
        i = @players.index(@current_player)
        next_player = (i + 1) % @players.length
        @current_player = @players[next_player]
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position,@current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                p "Victory! #{@current_player.mark} won!"
                return
            else
                self.switch_turn
            end
        end

        @board.print
        p "draw"
    end
    
end