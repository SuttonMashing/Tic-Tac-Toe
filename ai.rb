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
        transposed_board = board.transpose
        if board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != " " 
            return board[0][0]
        elsif board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != " " 
            return board[0][2]
        elsif board[0].all? {|x| x == board[0][0] } && board[0][0] != " " 
            return board[0][0]
        elsif  board[1].all? {|x| x == board[1][0] } && board[1][0] != " "  
            return board[1][0]
         board[2].all? {|x| x == board[2][0] } && board[2][0] != " "    
            return board[2][0]
        elsif transposed_board[0].all? {|x| x == transposed_board[0][0] } && transposed_board[0][0] != " " 
            return board[0][0]
        elsif transposed_board[1].all? {|x| x == transposed_board[1][0] } && transposed_board[1][0] != " " 
            return board[0][1]
        elsif transposed_board[2].all? {|x| x == transposed_board[2][0] } && transposed_board[2][0] != " "
           return board[0][2] #[[a,b],[c,d]] > [[a,c],[b,d]] 

        else
            return false
        end

    end

    def best_move(board)
        best_move = nil 
        possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "O"
                if win_check(board) == "O"
                    best_move = move
                end 
                board[row][col] = " "
            end
        return best_move
    end    

    def opponent_best_move(board)
        best_move = nil 
        possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "X"
                if win_check(board) == "X"
                    best_move = move
                end 
                board[row][col] = " "
            end
        return best_move
    end   
    
    def scores(board)
        if win_check(board) == "O"
            return 1
        elsif win_check(board) == "X"
            return -1
        elsif win_check(board) == false && available_spaces(board) == []
            return 0   
        end    
    end

    def minimax(board, player)
        result = scores(board)
        if result != nil
            return result
        end    
        if player == "O"
            max_score = -5
            possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "O"
                score = minimax(board, "X")
                if score > max_score
                    max_score = score
                end
                board[row][col] = " "
            end
            return max_score
        elsif player == "X"
            min_score = 5
            possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                board[row][col] = "X"
                score = minimax(board, "O") 
                if score < min_score
                    min_score = score
                end
                board[row][col] = " "
            end
            return min_score
        end 
    end    
    
end   