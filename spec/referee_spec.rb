require "./referee"

describe "Input" do
    it "Presents user with input prompt" do
        game = double("Board")
        rules = double("Rules")
        ref = Referee.new(rules, game)
        allow(ref).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
        #this test is passing but we do not see output (maybe weird rspec thing) -  to be checked when game runs 
    end

    it "Presents correct player with input prompt" do
        rules = Rules.new
        game = Board.new
        ref = Referee.new(rules, game, 1)
        allow(ref).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player O it is your turn\nPlease enter your move: \n").to_stdout
    end

    it "Takes in input and returns position" do
        rules = Rules.new
        game = Board.new
        ref = Referee.new(rules, game)
        allow(ref).to receive(:gets).and_return("C1\n")
        expect{ref.input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
        expect(ref.input).to eq("C1")
    end
    
end

describe "Which Winner" do
    it "Returns player X when given a player X winning board" do
        rules = Rules.new
        game = Board.new([["X"," ","O"],["X", "O", " "],["X", " ", " "]])
        ref = Referee.new(rules, game, 1)
        expect(ref.which_winner).to eq("Player X")
    end
end