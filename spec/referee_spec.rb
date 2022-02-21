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
        game = Game.new(rules, 1)
        allow(rules).to receive(:gets).and_return("C1\n")
        expect(game.move("C3", 1)).to eq([[[" "," "," "],[" "," "," "],[" "," ","O"]], 2]) 
        expect{game.passes_counter_for_input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
    end

    it "Takes in input and makes moves" do
        rules = Rules.new
        game = Game.new(rules)
        allow(rules).to receive(:gets).and_return("C1\n")
        expect{game.passes_counter_for_input}.to output("Player X it is your turn\nPlease enter your move: \n").to_stdout
        expect(game.passes_counter_for_input).to eq("C1")
    end
    
end