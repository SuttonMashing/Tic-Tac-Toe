class AI

    

    def is_empty?(x)
    
        if x == "X" or x == "O"        
            return false
        else 
            return true        
        end
    end    
    
    def available_spaces(board)

        empty_spaces = []
        
            for i in 0..2 do 
                for j in 0..2 do
                    if is_empty?(board[i][j])
                        empty_spaces << [i,j]
                    end  
                end 
            end    
        
        return empty_spaces
              
    end 


    def win_check(board)
        winner = nil
        transposed_board = board.transpose
        if board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != " " 
            winner = board[0][0]
        
        elsif board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != " " 
            winner = board[0][2]
        
        elsif board[0].all? {|x| x == board[0][0] } && board[0][0] != " "    
            winner = board[0][0]
        
        elsif board[1].all? {|x| x == board[1][0] } && board[1][0] != " " 
            winner = board[1][0]

        elsif board[2].all? {|x| x == board[2][0] } && board[2][0] != " "   
            winner = board[2][0]

        elsif transposed_board[0].all? {|x| x == transposed_board[0][0] } && transposed_board[0][0] != " " 
            winner = transposed_board[0][0]
        
        elsif transposed_board[1].all? {|x| x == transposed_board[1][0] } && transposed_board[1][0] != " " 
            winner = transposed_board[1][0]

        elsif transposed_board[2].all? {|x| x == transposed_board[2][0] } && transposed_board[2][0] != " "
            winner = transposed_board[2][0]
        elsif available_spaces(board) == []
            winner = "draw"
        end 
        return winner 

    end

    def best_move(board)
        dummy_board = board.dup
        best_move = nil 
        best_score = -100
        possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                dummy_board[row][col] = "O"
                score = minimax(board, true)
                dummy_board[row][col] = " "
                if score > best_score
                    best_score = score
                    best_move = move
                end 
            end
        return best_move
    end    

    def opponent_best_move(board)
        dummy_board = board.dup
        best_move = nil 
        possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                dummy_board[row][col] = "X"
                score = minimax(board, false)
                dummy_board[row][col] = " "
                if score > best_score
                    best_score = score
                    best_move = move
                end 
            end
        return best_move
    end    
    
    def minimax(board, maxmising)
        result = win_check(board)
        score_hash = {"X" => -1, "O" => 1, "draw" => 0}
        if result != nil 
            return score_hash[result]
        end
        if maxmising
            max_score = -100
            possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "O"
                score = minimax(board, false)
                board[row][col] = " "
                if score > max_score
                    max_score = score
                end
            end
            return max_score
        else 
            min_score = -100
            possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "O"
                score = minimax(board, true)
                board[row][col] = " "
                if score < max_score
                    min_score = score
                end
            end
            return min_score
        end
        
    end
end   