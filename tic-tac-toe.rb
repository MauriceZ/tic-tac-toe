class Game

    def initialize
        @places = { 'A1' => " ", 'A2' => " ", 'A3' => " ", 'B1' => " ", 'B2' => " ", 'B3' => " ", 'C1' => " ", 'C2' => " ", 'C3' => " " }
        @board = "   A | B | C \n 1 #{@places['A1']} | #{@places['B1']} | #{@places['C1']}  \n 2 #{@places['A2']} | #{@places['B2']} | #{@places['C2']} \n 3 #{@places['A3']} | #{@places['B3']} | #{@places['C3']} "
    end
    
    def start
		puts "Player 1's Name?"
		firstPlayer = Player.new(gets.chomp, "X")
		puts "Player 2's Name?"
		secondPlayer = Player.new(gets.chomp, "O")

		puts @board

		play_turns(firstPlayer, secondPlayer)
    end

	def play_turns(firstPlayer, secondPlayer)
		currentPlayer = firstPlayer

		until firstPlayer.has_won? || secondPlayer.has_won?
			move = " "
			puts "#{currentPlayer.name}, Enter Your Move:"
			while move == " "
				move = gets.chomp
				unless move =~ /[ABC][123]/ && @places[move] == " "
					move = " "
					puts "Invalid move, try again:"
				end
			end

			@places[move] = currentPlayer.mark		
			currentPlayer.add_move(move)

            @board = "   A | B | C \n 1 #{@places['A1']} | #{@places['B1']} | #{@places['C1']}  \n 2 #{@places['A2']} | #{@places['B2']} | #{@places['C2']} \n 3 #{@places['A3']} | #{@places['B3']} | #{@places['C3']} "
			puts @board

			currentPlayer = (currentPlayer == firstPlayer) ? secondPlayer : firstPlayer
		end
	end
end

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

def play
    Game.new.start
end

puts 'Type "play" to start playing!'








