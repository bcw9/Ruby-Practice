# tic-tac-toe program

require_relative 'board.rb'

puts "Starting tic-tac-toe..."

puts "\nWould you like to play a 1 or 2 player game?  Enter number and hit enter:"

numplay = gets.chomp
numplay = numplay.to_i

if numplay == 2

puts "\nYou have selected a two player game."

players = ['X','O']
current_player = players[rand(2)]

b = Board.new(current_player)
b.display()
puts

while not b.board_full() and not b.winner()
	b.human_move(current_player)
	current_player = b.get_next_turn()
	b.display()
	puts
end

elsif numplay ==1 

	puts "\nYou have selected a one player game."


# designate computer and human to X and O, randomly select who goes first

HUMAN_PLAYER = 'X'
COMPUTER_PLAYER = 'O'
arr = [HUMAN_PLAYER, COMPUTER_PLAYER]

current_player = arr[rand(2)]

puts "CURRENT PLAYER IS"
p current_player

b = Board.new(current_player)
b.display()
puts

while not b.board_full() and not b.winner()
	b.ask_move(current_player)
	current_player = b.get_next_turn_cpu_game()
	b.display()
	puts
end

end











if b.winner()
	puts "Player " + b.get_next_turn() + " wins"
else
	puts "Tie Game."
end
puts "Game Over"