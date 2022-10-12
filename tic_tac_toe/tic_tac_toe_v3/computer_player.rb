class ComputerPlayer

    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        p "computer chose position #{position} to play #{@mark}"
        position
    end

end