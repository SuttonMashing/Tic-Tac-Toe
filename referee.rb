require_relative "rules"
require_relative "board"
require_relative "inputoutput"


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
        move_prompt = "Please enter your move: "
        @input_output.send_output(move_prompt)
        return move = @input_output.get_input
    end

    def game_over_putter
        if @rules.game_over?(moves_remaining) == true
            @input_output.send_output("Game Over! It's a draw")
        end
    end

    def do_move(position)
        if @board.valid_move?(position) == false
            @input_output.send_output("Invalid Move!")
            
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
                win_message = "Game Over! #{player} wins!"
                @input_output.send_output(win_message)
                # outputs "want to play again yes no?" #future QoL updates
                # if input == no 
                    exit 
            end

            game_over_putter()

        end

        
    end

   


end

# board = Board.new
# rules = Rules.new
# ref = Referee.new(rules, board)
#if not commented out you MUST play to test 
# ref.main