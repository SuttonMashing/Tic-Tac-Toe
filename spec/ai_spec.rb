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

    it "places an O to win rather than block X winning" do
        ai = AI.new
        board = [[" ","X","X"],
                 [" ","O","O"],
                 ["X","O"," "]]
        expect(ai.best_move(board)).to eq([1, 0])   
    end

    it "goes for quickest win over multiple wins" do
        ai = AI.new
        board = [[" "," ","X"],
                 [" ","O"," "],
                 ["X"," ","O"]]
        expect(ai.best_move(board)).to eq([0, 0])   
    end


    it "test scores for winning board" do
        ai = AI.new
        board = [["O"," ","X"],
                 ["X","O","O"],
                 ["X"," ","O"]]
        expect(ai.scores(board)).to eq(100)    
    end

    it "check weird logic scores might have" do
        ai = AI.new
        board = [["O","O","X"],
                 ["X","O","O"],
                 ["X"," "," "]]
        expect(ai.scores(board)).to eq(nil)    
    end

end

describe "Blocks X from winning" do
    it "places an O in A3" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 ["X","O"," "]]
        expect(ai.best_move(board)).to eq([2, 2])    
    end

    it "places an O in C3" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 [" "," "," "]]
        expect(ai.best_move(board)).to eq([2, 2])    
    end

    it "places an O in A2" do
        ai = AI.new
        board = [["O"," ","O"],
                 ["X"," ","X"],
                 [" "," "," "]]
        expect(ai.best_move(board)).to eq([0, 1])    
    end

    it "places an O in B2" do 
        ai = AI.new
        board = [["X"," ","O"],
                 ["X"," ","X"],
                 ["O"," ","X"]]
        expect(ai.best_move(board)).to eq([1, 1])    
    end
end  

describe "Minimax" do
    it "return a 100 for a winning O board" do
        ai = AI.new
        board = [["X","X","O"],
                 ["O","O","O"],
                 ["X","O","X"]]
        expect(ai.minimax(board, 0, "O")).to eq(100)    
    end


    it "return a 0 for a draw" do
        ai = AI.new
        board = [["X","O","X"],
                 ["O","X","O"],
                 ["O","X","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(0)    
    end

    it "return -100 for a winning X board" do
        ai = AI.new
        board = [["O","O","X"],
                 ["X","X","X"],
                 ["O","X","O"]]
        expect(ai.minimax(board, 0, "X")).to eq(-100)    
    end

    it "return 100 for a winning O board in 1 move" do
        ai = AI.new
        board = [["O"," "," "],
                 ["X","X","O"],
                 ["X","X","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(100)    
    end

    it "return 100 for a winning vertical O board" do
        ai = AI.new
        board = [["O"," ","O"],
                 ["X","X","O"],
                 ["X","X","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(100)    
    end

    it "return -100 for a winning X board in 1 move" do
        ai = AI.new
        board = [["X","O"," "],
                 ["X","X","O"],
                 ["O","X"," "]]
        expect(ai.minimax(board, 0, "X")).to eq(-100)    
    end

    it "return 0 for a board that will draw in 2 moves" do
        ai = AI.new
        board = [["X"," ","O"],
                 ["O","X","X"],
                 ["X"," ","O"]]
        expect(ai.minimax(board, 0, "O")).to eq(0)  
          
    end

    it "returns 100 for O winning in 1 move" do
        ai = AI.new
        board = [["O"," ","X"],
                 ["X","O","O"],
                 ["X"," "," "]]
        expect(ai.minimax(board, 0, "O")).to eq(100)    
    end
end  

describe "win check returns winner for board" do
    it "return X for a winning bottom row X board" do
        ai = AI.new
        board = [["X"," ","O"],
                ["O","O","X"],
                ["X","X","X"]]
        expect(ai.win_check(board)).to eq("X")    
    end

    it "return X for a middle row winning X board" do
        ai = AI.new
        board = [["X"," ","O"],
                ["X","X","X"],
                ["X","O","X"]]
        expect(ai.win_check(board)).to eq("X")    
    end
end 
