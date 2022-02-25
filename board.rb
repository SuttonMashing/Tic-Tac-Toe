

#contains functions for making a move, stores baord as object inside itself, breaks down input
class Board

    def initialize(board = [[" "," "," "],[" "," "," "],[" "," "," "]])
        @board = board
    end

    def board_getter
        @board
    end

   def valid_move?(position) 
        character_length = position.length
        row = row_finder(position) #use row finder to give row on board
        col = col_finder(position) #use col finder to give col on board
        if row == false || col == false || character_length > 2
            return false
            
        elsif @board[row][col] == "X" or @board[row][col] == "O"
                # puts "Invalid Move!"
                return false
        else 
            return true        
        end
   end

    def move(position, counter)
        if position == ""
            return @board
    
        end   
        row = row_finder(position) #use row finder to give row on board
        col = col_finder(position) #use col finder to give col on board

        if @board[row][col] == " " && counter.even?  
          @board[row][col] = "X"  
          return @board, counter
        elsif @board[row][col] == " " && counter.odd?
            @board[row][col] = "O"  
            return @board, counter
        end    
        
        # A, B, C are rows represented by each subarray 
        # 1, 2, 3 are columns represented by each position in the subarray

    end

   
    
    
    def row_finder(position)
        row_position =  position[0,1].capitalize.to_sym
        row = {:A => 0, :B => 1, :C => 2}
         if row.key?(row_position) == false            
            return false  
        end  
        row[row_position]
    end 
    
    def col_finder(position)
        col_position =  (position[1,1].to_i) - 1
            if col_position.between?(0,2)
                return col_position
            else 
                return false 
            end    
    
    end 

    def print_board()
        puts "\n"
        @board.each do |r|
            puts r.each { |p| p }.join("|")
            puts "-----"
        end
    
    end 
    

end



