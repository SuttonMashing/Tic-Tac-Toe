require "./rules"
require "./board"

describe "Win Check" do
    it "Takes in board and check that is has a winning diagonal" do
        rules = Rules.new
        board = [["X","O"," "],["O", "X", " "],[" ", " ", "X"]]
        expect(rules.win_check(board)).to eq(true)
    end

    it "Takes in board and check that is has a winning horizontal" do
        rules = Rules.new
        board = [["X","X","X"],["O", "O", " "],[" ", " ", " "]]
        expect(rules.win_check(board)).to eq(true)
    end

    it "Takes in board and check that is has a winning horizontal" do
        rules = Rules.new
        board = [[" "," "," "],["O", "O", " "],["X", "X", "X"]]
        expect(rules.win_check(board)).to eq(true)
    end

    it "Takes in empty board and return false for win_check function" do
        rules = Rules.new
        board = [[" "," "," "],[" ", " ", " "],[" ", " ", " "]]
        expect(rules.win_check(board)).to eq(false)
    end

    it "Takes in board and check it has a winning vertical" do
        rules = Rules.new
        board = [["X"," ","O"],["X", "O", " "],["X", " ", " "]]
        expect(rules.win_check(board)).to eq(true)
    end

    it "Takes in board and check it has a middle winning vertical" do
        rules = Rules.new
        board = [[" ", "X", "O"],[" ", "X", " "],["O", "X", " "]]
        expect(rules.win_check(board)).to eq(true)
    end

end