class Player

    attr_accessor :name, :mark, :moves

    def initialize(name, mark)
        @name = name
        @mark = mark
        @moves = []
        @columnA, @columnB, @columnC, @row1, @row2, @row3, @diagA, @diagC = [], [], [], [], [], [], [], []
        @lines = [@columnA, @columnB, @columnC, @row1, @row2, @row3, @diagA, @diagC]
    end

    def has_won?
        return false if @moves.size < 3
        if @lines.any? { |line| line.size >= 3 }
            puts "#{@name} has won! Type \"play\" to play again!"
            return true
        else
            return false
        end

    end

    def add_move(move)
        @moves << move
        categorize_move(move)
    end

    def categorize_move(move)

        case move #Checks for diag
        when 'A1', 'C3'
            @diagA << move
        when 'B2'
            @diagA << move
            @diagC << move
        when 'A3', 'C1'
            @diagC << move
        else
            #error, figure it out later
        end

        case move[0] # Checks for column
        when 'A'
            @columnA << move
        when 'B'
            @columnB << move
        when 'C'
            @columnC << move
        else
            #error, figure it out later
        end

        case move[1] # Checks for row
        when '1'
            @row1 << move
        when '2'
            @row2 << move
        when '3'
            @row3 << move
        else
            #error, figure it out later
        end

    end

end