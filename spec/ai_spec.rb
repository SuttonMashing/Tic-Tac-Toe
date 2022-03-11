require "./ai"

describe "first placement" do
    it "places in the one empty space available" do
        ai = AI.new
        board = [["X","O","X"],
                 ["O","X","O"],
                 ["O","X"," "]]
        expect(ai.available_spaces(board)).to eq([[2, 2]])    
    end
end

describe "first placement, different position" do
    it "places in the one empty space available" do
        ai = AI.new
        board = [["X","O"," "],
                 ["O","X","X"],
                 ["O","X","O"]]
        expect(ai.available_spaces(board)).to eq([[0, 2]])    
    end
end

describe "When there are multiple empty spaces, returns a list of spaces" do
    it "returns array of string spaces" do
        ai = AI.new
        board = [["X","O"," "],
                 ["O"," ","X"],
                 [" ","X","O"]]
        expect(ai.available_spaces(board)).to eq([[0, 2], [1, 1], [2, 0]])    
    end
end

describe "Out of two empty spaces possible, it chooses the winning space" do
    it "places an O in A1" do
        ai = AI.new
        board = [[" ","O"," "],
                 ["O","X","X"],
                 ["O","X","X"]]
        expect(ai.best_move(board)).to eq([0, 0])    
    end
    it "places an O in A3" do
        ai = AI.new
        board = [[" ","O"," "], 
                 ["X","X","O"],
                 ["X","X","O"]]
        expect(ai.best_move(board)).to eq([0, 2])   
    end
    it "places an O in B2" do
        ai = AI.new
        board = [[" ","X","O"],
                 ["X"," ","X"],
                 ["O","O","X"]]
        expect(ai.best_move(board)).to eq([1, 1])    
    end

    it "places an O in C3" do
        ai = AI.new
        board = [["O"," ","X"],
                 ["X","O","O"],
                 ["X"," "," "]]
        expect(ai.best_move(board)).to eq([2, 2])    
    end

    it "test scores for winning board" do
        ai = AI.new
        board = [["O"," ","X"],
                 ["X","O","O"],
                 ["X"," ","O"]]
        expect(ai.scores(board)).to eq(1)    
    end

    it "check weird logic scores might have" do
        ai = AI.new
        board = [["O","O","X"],
                 ["X","O","O"],
                 ["X"," "," "]]
        expect(ai.scores(board)).to eq(nil)    
    end

end

describe "Out of two empty spaces possible, it chooses the winning space for opponent O" do
    it "places an O in A3" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 ["X","O"," "]]
        expect(ai.best_move(board)).to eq([2, 2])    
    end

    it "places an X in A3" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 [" "," "," "]]
        expect(ai.opponent_best_move(board)).to eq([2, 2])    
    end

    it "places an X in B2" do
        ai = AI.new
        board = [["O"," ","O"],
                 ["X"," ","X"],
                 [" "," "," "]]
        expect(ai.opponent_best_move(board)).to eq([1, 1])    
    end

    it "places an X in B2" do 
        ai = AI.new
        board = [["O"," ","O"],
                 ["X"," ","X"],
                 ["X"," ","X"]]
        expect(ai.opponent_best_move(board)).to eq([1, 1])    
    end
end  

describe "Minimax" do
    it "return a 1 for a winning O board" do
        ai = AI.new
        board = [["X","X","O"],
                 ["O","O","O"],
                 ["X","O","X"]]
        expect(ai.minimax(board, 0, "O")).to eq(1)    
    end


    it "return a 0 for a draw" do
        ai = AI.new
        board = [["X","O","X"],
                 ["O","X","O"],
                 ["O","X","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(0)    
    end

    it "return -1 for a winning X board" do
        ai = AI.new
        board = [["O","O","X"],
                 ["X","X","X"],
                 ["O","X","O"]]
        expect(ai.minimax(board, 0, "X")).to eq(-1)    
    end

    it "return 1 for a winning O board in 1 move" do
        ai = AI.new
        board = [["O"," "," "],
                 ["X","X","O"],
                 ["X","X","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(1)    
    end

    it "return -1 for a winning X board in 1 move" do
        ai = AI.new
        board = [["X","O"," "],
                 ["X","X","O"],
                 ["O","X"," "]]
        expect(ai.minimax(board, 0, "X")).to eq(-1)    
    end

    it "return 0 for a board that will draw in 2 moves" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 ["X"," ","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(0)  
          
    end

    it "returns 1 for O winning in 1 move" do
        ai = AI.new
        board = [["O"," ","X"],
                 ["X","O","O"],
                 ["X"," "," "]]
        expect(ai.minimax(board, 0, "O")).to eq(1)    
    end
    
    
end    