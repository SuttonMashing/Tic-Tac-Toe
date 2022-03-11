require_relative "rules"
require_relative "board"
require_relative "inputoutput"
require_relative "ai"


#Facilitate the game
#run game, call function for winner from rules class and check for draws 
class Referee

    def initialize(rules, board, counter=0, input_output=nil, ai=nil)
        @board = board
        @counter = counter
        @rules = rules
        @input_output = input_output
        @ai = ai
    end

    def ai_move
        computer_move = @ai.best_move(@board.board_getter) 
        hash = {:A => 0, :B => 1, :C => 2}
        row = hash.key(computer_move[0].to_i).to_s
        col = (computer_move[1].to_i + 1).to_s
        return move = row + col
    end    

    def counter_getter
        @counter
    end

    
    def input
            if @counter.even? 
                player_turn = "Player X it is your turn" 
                @input_output.send_output(player_turn)
                move_prompt = "Please enter your move: "
                @input_output.send_output(move_prompt)
                move = @input_output.get_input
            else
                player_turn = "Player O is taking its turn"
                move = ai_move
                @input_output.send_output(player_turn)
            end 
        return move
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
            return @board.board_getter
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

    def win_printer(player)
        win_message = "Game Over! #{player} wins!"
    end




    def main
        
        while @counter < 9
            position = input #[1,2] #A3

            current_board = do_move(position)

            board_printer   
            player = which_winner()

            if check_winner == true
                @input_output.send_output(win_printer(player))
                exit 
            end

            game_over_putter()

        end

        
    end

   


end

# board = Board.new
# inout = InputOutput.new
# ai = AI.new
# rules = Rules.new
# ref = Referee.new(rules, board, 0, inout, ai)
# # # # if not commented out you MUST play to test 
# ref.main