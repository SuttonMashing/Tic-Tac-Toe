require "./tictactoe"
require "./rules"

describe "Input" do
    it "Presents user with input prompt" do
    rules = Rules.new
        expect{rules.input}.to output("Player X it is your turn").to_stdout
    end

    it "Presents correct player with input prompt" do
        game = Game.new
        rules = Rules.new
        board = [["","",""],["","",""],["","",""]]
        expect(game.move("C3", board, 1)).to eq([[["","",""],["","",""],["","","O"]], 2]) 
        expect{rules.input}.to output("Player X it is your turn").to_stdout
    end

end