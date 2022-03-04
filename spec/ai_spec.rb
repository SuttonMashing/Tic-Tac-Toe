require "./ai"

describe "first placement" do
    it "places in the one empty space available" do
        ai = AI.new
        board = [["X","O","X"],["O","X","O"],["O","X"," "]]
        expect(ai.best_move(board)).to eq("C3")    
    end
end

describe "first placement, different position" do
    it "places in the one empty space available" do
        ai = AI.new
        board = [["X","O"," "],
                 ["O","X","X"],
                 ["O","X","O"]]
        expect(ai.best_move(board)).to eq("A3")    
    end
end