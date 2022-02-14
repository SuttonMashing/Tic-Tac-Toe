class Game

    def board(position)

        # A, B, C are rows represented by each subarray 
        # 1, 2, 3 are columns represented by each position in the subarray
    case position   
    when "B2"
        return [["","",""],["","X",""],["","",""]]
    when "C1"
        return [["","",""],["", "", ""],["X","",""]]   
    else 
        return [["","",""],["","",""],["","",""]]
    end

    end
    
    def row_finder(position)
        row = {:A => 0, :B => 1, :C => 2}
        position = position.to_sym
        row[position]

    end    

end







