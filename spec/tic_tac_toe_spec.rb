require "./tictactoe"

describe "Board" do 
    it "initialises empty 3x3 board" do
        game = Game.new
        expect(game.board("")).to eq([["","",""],["","",""],["","",""]]) 
    end

    it "places Cross in centre of board" do
        game = Game.new
        expect(game.board("B2")).to eq([["","",""],["", "X", ""],["","",""]]) 
    end

    it "places Cross in bottom left" do
        game = Game.new
        expect(game.board("C1")).to eq([["","",""],["", "", ""],["X","",""]]) 
    end

end

describe "row finder" do
    it "gets row given index" do
        game = Game.new
        expect(game.row_finder("C1")).to eq(2) 
    end
end

describe "column finder" do
    it "gets column given index" do
        game = Game.new
        expect(game.col_finder("C1")).to eq(0) 
    end
end