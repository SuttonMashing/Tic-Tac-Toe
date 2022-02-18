#run game, call function for winner from rules class and check for draws 
class Main

    def main
        
        while @counter < 9
            position = input()

            current_board = move(position, @counter)

            print_board(@board)  

    
            
        end
        print  "Game over" 
            
        
    end
end