require "./tictactoe"
require "./rules"

describe "Input" do
    it "Presents user with input prompt" do
    rules = Rules.new
        expect(rules.input).to eq("Player X it is your turn")
    end
end