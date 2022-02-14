require "./tictactoe"

describe "Board" do 
    it "initialises empty 3x3 board" do
        game = Game.new
        expect(game.board).to eq([["","",""],["","",""],["","",""]]) 
    end

    it "places Cross in centre of board" do
        game = Game.new
        expect(game.board).to eq([["","",""],["", "X", ""],["","",""]]) 
    end

end