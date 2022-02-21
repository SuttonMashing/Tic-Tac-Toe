require_relative "rules"
require_relative "board"

#Facilitate the game
#run game, call function for winner from rules class and check for draws 
class Referee

    def initialize(rules, board, counter=0)
        @board = board
        @counter = counter
        @rules = rules
    end

    
    def input
        if @counter.even? 
            puts "Player X it is your turn" 
            puts "Please enter your move: "
            move = gets.chomp
        else
            puts "Player O it is your turn"
            puts "Please enter your move: "
            move = gets.chomp
        end
    end

    def passes_remaining_moves_to_rules
        @rules.game_over?(moves_remaining)
    end

    def do_move
        @board.move(position, @counter)
    end

    def moves_remaining
        remaining_moves = 9 - @counter
    end

    def main
        
        while @counter < 9
            position = input

            current_board = move(position, @counter)

            print_board(@board.board_getter)  

        end

        print  "Game over" 
            
        
    end

   


end

