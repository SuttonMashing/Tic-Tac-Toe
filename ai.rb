class AI

    

    def is_empty?(x)
    
        if x == "X" or x == "O"        
            return false
        else 
            return true        
        end
    end    
    
        def best_move(board)

            board_hash = {:A1 => 0, :A2 => 1, :A3 => 2, :B1 => 3, :B2 => 4, :B3 => 5, :C1 => 6, :C2 => 7, :C3 => 8}
    
            ind_index = -1
            

             board.each do |subarray|
                subarray.each do |index| 
                    ind_index += 1
                    if is_empty?(index)
                        position = board_hash.key(ind_index).to_s
                        return position
                    end  
                end      
            end    
               
    
           
    
        end 
    
    end   