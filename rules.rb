require "./tictactoe"

class Rules
    attr_accessor :input
    attr_accessor :counter

    def input
        
        if Game.counter.even? 
            print "Player X it is your turn"
        end
    end
end


# def main 

#     do input to user
#         < input
#     do move(input, baord, counter)

#     end 