require "./referee"

describe "Input" do
    it "Presents user with input prompt" do
        game = double("Board")
        rules = double("Rules")
        inout = InputOutput.new
        ref = Referee.new(rules, game, 0, inout)
        allow(inout).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
    end

    it "Presents correct player with input prompt" do
        game = double("Board")
        rules = double("Rules")
        inout = InputOutput.new
        ref = Referee.new(rules, game, 1, inout)
        allow(inout).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player O it is your turn\nPlease enter your move: \n").to_stdout
    end

    it "Takes in input and returns position" do
        game = double("Board")
        rules = double("Rules")
        inout = InputOutput.new
        ref = Referee.new(rules, game, 0, inout)
        allow(inout).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
        expect(ref.input).to eq("C1")
    end
    
end

describe "Which Winner" do
    it "Returns player X when given a player X winning board" do
        rules = double("Rules")
        game = Board.new([["X"," ","O"],["X", "O", " "],["X", " ", " "]])
        ref = Referee.new(rules, game, 1)
        expect(ref.which_winner).to eq("Player X")
    end
end

describe "Main" do 
    it "Plays full game and declares a draw" do
        game = Board.new
        rules = Rules.new 
        inout = InputOutput.new
        ref = Referee.new(rules, game, 0, inout)
        allow(inout).to receive(:gets).and_return("C1", "A1", "B1", "B2", "C3", "C2", "A2", "B3", "A3")
        ref.board_printer()
        ref.main
        expect{ref.game_over_putter}.to output("Game Over! It's a draw\n").to_stdout  
    end
end