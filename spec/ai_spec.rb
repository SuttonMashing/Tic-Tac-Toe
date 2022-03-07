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
        board = [[" ","X"," "], 
                 ["X","O","O"],
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
end