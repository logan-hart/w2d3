class Board

    def self.build_stacks(n)
        Array.new(n) {Array.new(0)}
    end

    attr_reader :max_height

    def initialize(num_stacks, max_height)
        raise "rows and cols must be >=4" if num_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.any? do |row|
            row.all? {|ele| ele == token} && row.length == @max_height
        end
    end

    def horizontal_winner?(token)
        (0...@max_height).any? do |col_idx|
            @stacks.each_index.all? do |stack_idx|
                @stacks[stack_idx][col_idx] == token
            end
        end
    end 

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
