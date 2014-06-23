class Game
	def start

		@A1, @B1, @C1, @A2, @B2, @C2, @A3, @B3, @C3 = " ", " ", " ", " ", " ", " ", " ", " ", " "

		board = "   A | B | C \n 1 #{@A1} | #{@B1} | #{@C1}  \n 2 #{@A2} | #{@B2} | #{@C2} \n 3 #{@A3} | #{@B3} | #{@C3} "

		puts "Player 1's Name?"
		firstPlayer = Player.new(gets.chomp, "X")
		puts "Player 2's Name?"
		secondPlayer = Player.new(gets.chomp, "O")

		puts board

		play_turns(firstPlayer, secondPlayer);
	end

	def play_turns(firstPlayer, secondPlayer)
		
		currentPlayer = firstPlayer

		until firstPlayer.has_won? || secondPlayer.has_won?
			move = " "
			puts "#{currentPlayer.name}, Enter Your Move:"
			while move == " "
				move = gets.chomp
				if move !=~ /[ABC][123]/
					move = " "
					"Invalid move, try again"
				end
			end

			instance_variable_set("@#{move}", currentPlayer.mark)
			puts move #testing purposes
			
			currentPlayer.moves << move
			puts board

			currentPlayer = (currentPlayer == firstPlayer) ? secondPlayer : firstPlayer
		end
	end
end

class Player

	attr_accessor :name, :mark, :moves

	@moves = []

	def initialize(name, mark)
		@name = name
		@mark = mark
	end

	def has_won?
		@moves
	end
end