

#run game, call function for winner from rules class and check for draws 
class Main

    def initialize(rules)
        @rules = rules

    def main(counter)
        
        while counter < 9
            position = input(counter)

            current_board = move(position, counter)

            print_board(@board)  

    
            
        end
        print  "Game over" 
            
        
    end

    def passes_counter_for_input
        @rules.input(@counter)
    end
end

