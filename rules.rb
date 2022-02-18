#takes input and has a function checking for winner
#to do: make function checking for winning pattern
class Rules

    def input(counter)
        if counter.even? 
            puts "Player X it is your turn" 
            puts "Please enter your move: "
            move = gets.chomp
        else
            puts "Player O it is your turn"
            puts "Please enter your move: "
            move = gets.chomp
        end
    end

    def game_over?(moves_remaining)
        if moves_remaining == 0
            return true
        else 
            return false
        end
    end
    
end
