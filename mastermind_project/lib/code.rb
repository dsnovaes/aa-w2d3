class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

    attr_reader :pegs

    def self.valid_pegs?(arr)
      arr.all? { |ele| POSSIBLE_PEGS.include?(ele.upcase) }
    end

    def initialize(arr)
      raise "invalid pegs" if !Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    end

    def self.random(length)
      Code.new( Array.new(length) { POSSIBLE_PEGS.keys.sample } )
    end

    def self.from_string(string)
      Code.new(string.upcase.split(""))
    end

    def [](index)
      @pegs[index]
    end

    def length
      @pegs.length
    end

    def num_exact_matches(code)
      count = 0 
      code.pegs.each_with_index { |guess,i| count+=1 if @pegs[i] == guess }
      count
    end

    def num_near_matches(code)
      # code.pegs.count { |guess| @pegs.include?(guess) }
      count = 0 
      code.pegs.each_with_index do |guess,i| 
        puts guess + @pegs[i]
        if @pegs.include?(guess) && code.pegs[i] != @pegs[i]
          puts "count +1"
          count+=1 
        end
      end
      count
    end
    
    def ==(code)
      code.pegs == @pegs
    end


end
