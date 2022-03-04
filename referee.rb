require_relative "rules"
require_relative "board"

class InputOutput
    def send_output(output)
        puts output
    end
    def get_input()
        return gets.chomp
    end
end

#Facilitate the game
#run game, call function for winner from rules class and check for draws 
class Referee

    def initialize(rules, board, counter=0, input_output=nil)
        @board = board
        @counter = counter
        @rules = rules
        @input_output = input_output
    end

    def counter_getter
        @counter
    end

    
    def input
            if @counter.even? 
                player_turn = "Player X it is your turn" 
                
            else
                player_turn = "Player O it is your turn"
                
            end 
        @input_output.send_output(player_turn)
        move = @input_output.get_input
        move_prompt = "Please enter your move: "
        @input_output.send_output(move_prompt)
    end

    def game_over_putter
        if @rules.game_over?(moves_remaining) == true
            return "Game Over! It's a draw"
        end
        return ""
    end

    def do_move(position)
        if @board.valid_move?(position) == false
            puts "Invalid Move!"
        else
            @board.move(position, @counter)
            @counter += 1
            return @board.board_getter, @counter
        end
    end

    def moves_remaining
        remaining_moves = 9 - @counter
    end

    def board_printer
        @board.print_board()  
    end    

    def check_winner
        @rules.win_check(@board.board_getter)
    end

    def which_winner()
        player = ""
       if @counter.odd?
         player = "Player X"
       else 
        player = "Player O"
        end
        return player
    end




    def main
        
        while @counter < 9
            position = input

            current_board = do_move(position)

            board_printer   
            player = which_winner()

            if check_winner == true
                puts "Game Over! #{player} wins!"
                exit 
            end

            print game_over_putter

        end

        
    end

   


end

# board = Board.new
# rules = Rules.new
# ref = Referee.new(rules, board)
#if not commented out you MUST play to test 
# ref.main