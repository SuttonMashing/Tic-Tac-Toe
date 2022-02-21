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

    def counter_getter
        @counter
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

    def game_over_putter
        if @rules.game_over?(moves_remaining) == true
            print "Game Over!"
        end
    end

    def do_move(position)
        @board.move(position, @counter)
        @counter += 1
        return @board.board_getter, @counter
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

        
        
    end

   


end

