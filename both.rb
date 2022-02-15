

class Game
    attr_accessor :counter
    
    def initialize 
        @counter = 0
    end

    board = [[" "," "," "],[" "," "," "],[" "," "," "]]
    

    def move(position, board, counter)
        if position == ""
            return board
    
        end   
        row = row_finder(position) #use row finder to give row on board
        col = col_finder(position) #use col finder to give col on board

        if board[row][col] == "" && counter.even?  
          board[row][col] = "X"  
          counter += 1
          return board, counter
        elsif board[row][col] == "" && counter.odd?
            board[row][col] = "O"  
            counter += 1
            return board, counter
          
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

    def print_board(board)
        puts "\n"
        board.each do |r|
            puts r.each { |p| p }.join("|")
            puts "-----"
        end
    
    end 
    
    def input
        
        if @counter.even? 
            print "Player X it is your turn"
        end
    end
    

end





# def main 

#     do input to user
#         < input
#     do move(input, baord, counter)

#     end 