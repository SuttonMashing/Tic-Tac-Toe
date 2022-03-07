class AI

    

    def is_empty?(x)
    
        if x == "X" or x == "O"        
            return false
        else 
            return true        
        end
    end    
    
    def available_spaces(board)

        board_hash = {:A1 => 0, :A2 => 1, :A3 => 2, :B1 => 3, :B2 => 4, :B3 => 5, :C1 => 6, :C2 => 7, :C3 => 8}

        ind_index = -1
        empty_spaces = []
        

            board.each do |subarray|
            subarray.each do |index| 
                ind_index += 1
                if is_empty?(index)
                    position = board_hash.key(ind_index).to_s
                    empty_spaces << position
                end  
            end 
        end    
        if empty_spaces.length == 1
            return empty_spaces[0]
        else
            return empty_spaces
        end         
    end 

    def row_finder(position)
        row_position = position[0,1].capitalize.to_sym
        row = {:A => 0, :B => 1, :C => 2}
         if row.key?(row_position) == false            
            return false  
        end  
        row[row_position]
    end 
    
    def col_finder(position)
        col_position = (position[1,1].to_i) - 1
            if col_position.between?(0,2)
                return col_position
            else 
                return false 
            end    
    
    end 

    def best_move(board)
        row = 0
        col = 0
        best_move = "B2"
        possible_moves = available_spaces(board)
            possible_moves.each do |index|
                row = row_finder(index)
                col = col_finder(index)
                if row == 0 && col == 0
                    if (board[0] == [" ", "O", "O"]) || (board[1][0] == "O" && board[2][0] == "O") || (board[1][1] == "O" && board[2][2] == "O")
                        best_move = index 
                    end
                elsif row == 0 && col == 2 
                    if (board[0] == ["O", "O", " "]) || (board[1][2] == "O" && board[2][2] == "O") || (board[1][1] == "O" && board[2][0] == "O")
                        best_move = index 
                    end
                end               
            end
        return best_move #only returns last value
    end    
    
end   