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
            return true
        elsif board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != " " 
            return true
        elsif board[0].all? {|x| x == board[0][0] } && board[0][0] != " " || board[1].all? {|x| x == board[1][0] } && board[1][0] != " "  || board[2].all? {|x| x == board[2][0] } && board[2][0] != " "    
            return true

        elsif transposed_board[0].all? {|x| x == transposed_board[0][0] } && transposed_board[0][0] != " " || transposed_board[1].all? {|x| x == transposed_board[1][0] } && transposed_board[1][0] != " " || transposed_board[2].all? {|x| x == transposed_board[2][0] } && transposed_board[2][0] != " "
           return true #[[a,b],[c,d]] > [[a,c],[b,d]] 

        else
            return false
        end

    end

    def best_move(board)
        dummy_board = board.dup
        best_move = nil 
        possible_moves = available_spaces(board)
            possible_moves.each do |move| 
                row = move[0]
                col = move[1]
                dummy_board[row][col] = "O"
                if win_check(dummy_board) == true
                    best_move = move
                end 
                dummy_board[row][col] = " "
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
                if win_check(dummy_board) == true
                    best_move = move
                end 
                dummy_board[row][col] = " "
            end
        return best_move
    end   
    
    
    def minimax(board)
        if win_check(board) == true
            return 1
        elsif available_spaces(board) == []
            return 0    
        end    
    end    
    
end   