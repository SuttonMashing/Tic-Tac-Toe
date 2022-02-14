class Game

    board = [["","",""],["","",""],["","",""]]


    def move(position, board)
        if position == ""
            return board
    
        end   
        row = row_finder(position) #use row finder to give row on board
        col = col_finder(position) #use col finder to give col on board

        if board[row][col] == ""
          board[row][col] = "X"  
          return board 
        else 
            return "Invalid Move!"
        end    
        

        # A, B, C are rows represented by each subarray 
        # 1, 2, 3 are columns represented by each position in the subarray

    end
    
    def row_finder(position)
        row_position =  position[0,1].to_sym
        row = {:A => 0, :B => 1, :C => 2}
        row[row_position]
    end 
    
    def col_finder(position)
        col_position =  (position[1,1].to_i) - 1
    
    end 
    

end







