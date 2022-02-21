#takes input and has a function checking for winner
#to do: make function checking for winning pattern
class Rules

    
    def input(counter)
        if counter.even? 
            puts "Player X it is your turn" 
            puts "Please enter your move: "
            move = gets.chomp
        else
            puts "Player O it is your turn"
            puts "Please enter your move: "
            move = gets.chomp
        end
    end

    def game_over?(moves_remaining)
        if moves_remaining == 0
            return true
        else 
            return false
        end
    end

    def win_check(board)
        if board[0][0] == board[1][1] && board[0][0] == board[2][2]
            return true
        elsif board[0][2] == board[1][1] && board[0][2] == board[2][0]
            return true
        else
            return false
        end
    end
end
