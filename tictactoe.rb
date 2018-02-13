class TicTacToe
	attr_accessor :board
	attr_reader :player1, :player2
	
	def initialize 
		@board = ["-","-","-","-","-","-","-","-","-"]
		@player1 = []
		@player2 = []
		puts "> ATTN: select 1 - 9 to input your symbol with first row starting from 1, 2, 3, followed by second row 4, 5, 6 and finally 7, 8 9 for the last row at the bottom"
	end 
	
	def touch(num)
		if check_turn == "Its Player 1's turn"
			board[num-1] = "O"
			@player1 << "O"
		else 
			board[num-1] = "X"
			@player2 << "X"
		end  
	end 

	def verify 
		circle = ["O","O","O"]
		cross = ["X","X","X"]

		check1 = [board[0],board[1],board[2]]
		check2 = [board[3],board[4],board[5]]
		check3 = [board[6],board[7],board[8]]
		check4 = [board[0],board[3],board[6]]
		check5 = [board[1],board[4],board[7]]
		check6 = [board[2],board[5],board[8]]
		check7 = [board[0],board[4],board[8]]
		check8 = [board[2],board[4],board[6]]
		all = [check1, check2, check3, check4, check5, check6, check7, check8]
	
		all.each do |a|
			if a == circle 
				@statement = "Player 1 has won"
				break
			elsif a == cross 
				@statement = "Player 2 has won" 
				break
			else 
				if board.include?("-")
					@statement = "The game continues, next move please!"
				else
					@statement = "It's a Draw! Good game."
				end 
			end
		end
		return @statement
	end 

	def check_turn 
		@turn = ""
		a = @player1.count 
		b = @player2.count 
		if b > a 
			@turn = "Its Player 1's turn"
		elsif a > b 
			@turn = "Its Player 2's turn"
		else 
			@turn ="Its Player 1's turn"
		end 
		return @turn
	end 


	def check_overlap(num)
		board[num-1] == "O" || board[num-1] == "X"
	end 

	def display 
		show = board.each_slice(3).to_a
		p "-"*13
		show.each do |x| 
			p "| " + x.join(" | ") + " |" 
			p "-"*13
		end
	end 
end 

# Tic Tac Toe Time~! Woohooo~ 

p "Welcome to Tic Tac Toe Mania!"
p "Would like to play? Please input 'yes' or 'no'"
unless answer == "yes" || answer == "no"
	if false 
		p "please only input 'yes' or 'no'"
	end 
	answer = gets.chomp.downcase 
end 

while answer != "no"
	p "Let us begin!"
	sleep(5)
	@game = TicTacToe.new 
	@game.display
	until @game.verify == "Player 1 has won" || @game.verify == "Player 2 has won" || @game.verify == "It's a Draw! Good game."
		if @game.player1.count == 0
			@num = nil
			until (1..9).include? @num do 
				p "> " + @game.check_turn 
				p "> Please input number between 1 - 9"
				@num = gets.chomp.to_i 
				if @num < 1 || @num > 9 
					p "> Sorry, the input provided is not within the permitted range, please try again."
				end
			end 
			p "> you chose slot no. #{@num}"
		else 
			while @game.check_overlap(@num) == true 
				@num = nil
				until (1..9).include? @num do 
					p "> " +  @game.check_turn 
					p "> Please input number between 1 - 9"
					@num = gets.chomp.to_i 
					if @num < 1 || @num > 9 
						p "> Sorry, the input provided is not within the permitted range, please try again."
					end
				end 
				p "> you chose slot no. #{@num}"
				@game.check_overlap(@num)
				if @game.check_overlap(@num) == true
					p "> Slot no. #{@num} has been taken, please choose again"
				end 
			end 
		end 
		@game.touch(@num)
		@game.display
		p @game.verify
	end 
	p "Would you like to play another round of Tic Tac Toe?"
	p "Would like to play? Please input 'yes' or 'no'"
	unless answer == "yes" || answer == "no"
		if false 
			p "please only input 'yes' or 'no'"
		end 
		answer = gets.chomp.downcase 
	end 
end 

p "Thank you for playing, hope you enjoyed the game :)"