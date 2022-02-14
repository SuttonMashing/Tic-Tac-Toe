require "./tictactoe"



describe "Board" do 
    it "initialises empty 3x3 board" do
        board = [["","",""],["","",""],["","",""]]
        game = Game.new
        expect(game.move("", board)).to eq([["","",""],["","",""],["","",""]]) 
    end

    it "places Cross in centre of board" do
        board = [["","",""],["","",""],["","",""]]
        game = Game.new
        expect(game.move("B2", board)).to eq([["","",""],["", "X", ""],["","",""]]) 
    end

    it "places Cross in bottom left" do
        board = [["","",""],["","",""],["","",""]]
        game = Game.new
        expect(game.move("C1", board)).to eq([["","",""],["", "", ""],["X","",""]]) 
    end

    it "if there is already a cross in B1, print invalid move" do
        board = [["","",""],["X","",""],["","",""]]
        game = Game.new
        expect(game.move("B1", board)).to eq("Invalid Move!") 
    end

    it "takes A1, B2, C3" do
        board = [["","",""],["","",""],["","",""]]
        game = Game.new
        expect(game.move("A1", board)).to eq([["X","",""],["","",""],["","",""]]) 
        expect(game.move("B2", board)).to eq([["X","",""],["","X",""],["","",""]]) 
        expect(game.move("C3", board)).to eq([["X","",""],["","X",""],["","","X"]]) 
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