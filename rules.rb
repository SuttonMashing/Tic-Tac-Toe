class Rules
    
    def game_over?(moves_remaining)
        if moves_remaining == 0
            return true
        else 
            return false
        end
    end

    def win_check(board)
        transposed_board = board.transpose
        if board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != " " 
            return true
        elsif board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != " " 
            return true
        elsif board[0].all? {|x| x == board[0][0] } && board[0][0] != " " || board[1].all? {|x| x == board[1][0] } && board[1][0] != " "  || board[2].all? {|x| x == board[2][0] } && board[2][0] != " "    
            return true
        elsif transposed_board[0].all? {|x| x == transposed_board[0][0] } && transposed_board[0][0] != " " || transposed_board[1].all? {|x| x == transposed_board[1][0] } && transposed_board[1][0] != " " || transposed_board[2].all? {|x| x == transposed_board[2][0] } && transposed_board[2][0] != " "
           return true 
        else
            return false
        end

    end
end
