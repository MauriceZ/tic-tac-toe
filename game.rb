class Game

    def initialize
        @spaces = { 'A1' => " ", 'A2' => " ", 'A3' => " ", 'B1' => " ", 'B2' => " ", 'B3' => " ", 'C1' => " ", 'C2' => " ", 'C3' => " " }
        @board = "   A | B | C \n 1 #{@spaces['A1']} | #{@spaces['B1']} | #{@spaces['C1']}  \n 2 #{@spaces['A2']} | #{@spaces['B2']} | #{@spaces['C2']} \n 3 #{@spaces['A3']} | #{@spaces['B3']} | #{@spaces['C3']} "
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

		until firstPlayer.has_won? || secondPlayer.has_won? || tie_game?
			move = " "
			puts "#{currentPlayer.name} (#{currentPlayer.mark}), Enter Your Move:"
			while move == " "
				move = (gets.chomp).strip
				unless move =~ /[ABC][123]/ && @spaces[move] == " "
					move = " "
					puts "Invalid move, try again:"
				end
			end

			@spaces[move] = currentPlayer.mark		
			currentPlayer.add_move(move)

            update_board
			puts @board

			currentPlayer = (currentPlayer == firstPlayer) ? secondPlayer : firstPlayer
		end
	end

	def tie_game?
		if @spaces.values.all? { |space| space == "X" || space == "O" }
			puts "It's a tie!"
			return true
		else
			return false
		end
	end

	def update_board
		@board = "   A | B | C \n 1 #{@spaces['A1']} | #{@spaces['B1']} | #{@spaces['C1']}  \n 2 #{@spaces['A2']} | #{@spaces['B2']} | #{@spaces['C2']} \n 3 #{@spaces['A3']} | #{@spaces['B3']} | #{@spaces['C3']} "
	end

end