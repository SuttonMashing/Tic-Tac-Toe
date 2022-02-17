require "./both"

describe "Input" do
    it "Presents user with input prompt" do
        game = Game.new
        allow(game).to receive(:gets).and_return("C1\n")
        expect{game.input}.to output("Please enter your move: ").to_stdout
    end

    it "Presents correct player with input prompt" do
        game = Game.new
        allow(game).to receive(:gets).and_return("C1\n")
        expect(game.move("C1", 0)).to eq([[[" "," "," "],[" "," "," "],["X"," "," "]], 1])
        expect(game.move("C3", 1)).to eq([[[" "," "," "],[" "," "," "],["X"," ","O"]], 2]) 
        expect{game.input}.to output("Please enter your move: ").to_stdout
    end

    it "Takes in input and makes moves" do
        game = Game.new 
        allow(game).to receive(:gets).and_return("C1\n")
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        expect{game.input}.to output("Please enter your move: ").to_stdout
        expect(game.input).to eq("C1")
    end

    it "Checking it prints the input after each turn" do
        game = Game.new 
        allow(game).to receive(:gets).and_return("C1\n")
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        expect{game.input}.to output("Please enter your move: ").to_stdout
        expect(game.main).to eq([[" "," "," "],[" "," "," "],["X"," "," "]])
    end
    

end

describe "Board" do 
    it "initialises empty 3x3 board" do
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        game = Game.new
        expect(game.move("", 0)).to eq([[" "," "," "],[" "," "," "],[" "," "," "]]) 
    end

    it "places Cross in centre of board" do
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        game = Game.new
        expect(game.move("B2", 0)).to eq([[[" "," "," "],[" ", "X", " "],[" "," "," "]], 1]) 
    end

    it "places Cross in bottom left" do
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        game = Game.new
        expect(game.move("C1", 0)).to eq([[[" "," "," "],[" ", " ", " "],["X"," "," "]], 1]) 
    end

    it "if there is already a cross in B1, print invalid move" do
        game = Game.new
        expect(game.move("B1", 0)).to eq([[[" "," "," "],["X"," "," "],[" "," "," "]], 1]) 
        expect(game.move("B1", 0)).to eq("Invalid Move!") 
    end

    it "takes A1, B2, C3" do
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        game = Game.new
        expect(game.move("A1", 0)).to eq([[["X"," "," "],[" "," "," "],[" "," "," "]], 1]) 
        expect(game.move("B2", 1)).to eq([[["X"," "," "],[" ","O"," "],[" "," "," "]], 2])  
        expect(game.move("C3", 2)).to eq([[["X"," "," "],[" ","O"," "],[" "," ","X"]], 3]) 
    end

    it "If counter = 1, place player 'O'" do
        game = Game.new(1)
        expect(game.move("A1", 1)).to eq([[["O"," "," "],[" "," "," "],[" "," "," "]], 2]) 
    end

    it "Increases counter by 1 for each move" do
        board = [[" "," "," "],[" "," "," "],[" "," "," "]]
        game = Game.new
        expect(game.move("C3", 0)).to eq([[[" "," "," "],[" "," "," "],[" "," ","X"]], 1])
    end

    it "When counter reaches 9 the message 'Game over' is printed" do
        game = Game.new(9)
        expect{game.main}.to output("Game over").to_stdout
    end

    # it "prints the current board" do
    #     board = [[" ","X"," "],["O"," "," "],[" "," ","O"]]
    #     game = Game.new
    #     expect(game.print_board(board)).to eq([[" ","X"," "],["O"," "," "],[" "," ","O"]])
    # end



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